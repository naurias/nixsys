{ lib
, stdenv
, fetchurl
, rpmextract
, autoPatchelfHook
, makeWrapper
, w3m
# Runtime dependencies
, alsa-lib
, at-spi2-core
, cairo
, cups
, dbus
, expat
, fontconfig
, freetype
, gdk-pixbuf
, glib
, gtk3
, gtk4
, libdrm
, libnotify
, libxkbcommon
, mesa
, nspr
, nss
, pango
, pipewire
, systemd
, wayland
, xorg
, zlib
, xdg-utils
}:

stdenv.mkDerivation rec {
  pname = "vivaldi";
  version = "7.7.3851.52";
  rpmVersion = "7.7.3851.52-1";

  src = fetchurl {
    url = "https://downloads.vivaldi.com/stable/vivaldi-stable-${rpmVersion}.x86_64.rpm";
    # SHA512 from the PKGBUILD
    sha512 = "59658914005e3250f91c66293adec132cded1b109b264916f38eaaf526d364fab750950ec35d4cea279e78751356e133af3f8a85c73b0f09c99912eb3a1731a6";
  };

  nativeBuildInputs = [
    rpmextract
    autoPatchelfHook
    makeWrapper
    w3m
  ];

  buildInputs = [
    alsa-lib
    at-spi2-core
    cairo
    cups
    dbus
    expat
    fontconfig
    freetype
    gdk-pixbuf
    glib
    gtk3
    gtk4
    libdrm
    libnotify
    libxkbcommon
    mesa
    nspr
    nss
    pango
    pipewire
    systemd
    wayland
    zlib
    # Xorg dependencies
    xorg.libX11
    xorg.libXcomposite
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXrandr
    xorg.libXrender
    xorg.libXScrnSaver # libxss in Arch
    xorg.libXtst
    xorg.libxcb
    xorg.libxshmfence
  ];

  unpackPhase = ''
    rpmextract $src
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share $out/bin

    # Move the main directory
    cp -r opt/vivaldi $out/share/vivaldi

    # Install Icons (Replicating PKGBUILD logic)
    mkdir -p $out/share/pixmaps
    ln -sf $out/share/vivaldi/resources/vivaldi/resources/welcomepage-vivaldi.svg $out/share/pixmaps/vivaldi.svg
    ln -sf $out/share/vivaldi/product_logo_256.png $out/share/pixmaps/vivaldi.png

    # Handle License (using w3m as requested in PKGBUILD)
    mkdir -p $out/share/licenses/vivaldi
    if [ -f "$out/share/vivaldi/LICENSE.html" ]; then
      w3m -dump "$out/share/vivaldi/LICENSE.html" | head -n 5 > "$out/share/licenses/vivaldi/license.txt"
    else
      echo "License file not found"
    fi

    # Install desktop file and metainfo
    install -Dm644 usr/share/appdata/vivaldi.appdata.xml -t $out/share/metainfo/
    # Note: We usually let Nix generate the desktop item or copy it from usr/share/applications if it exists in the RPM
    if [ -d usr/share/applications ]; then
        cp -r usr/share/applications $out/share/
        # Fix the Exec path in the desktop file
        substituteInPlace $out/share/applications/vivaldi-stable.desktop \
            --replace "/usr/bin/vivaldi-stable" "vivaldi"
    fi

    runHook postInstall
  '';

  postFixup = ''
    # Create the wrapper
    # We wrap the binary to ensure it finds necessary libs and XDG utils
    makeWrapper $out/share/vivaldi/vivaldi $out/bin/vivaldi \
      --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath buildInputs} \
      --prefix PATH : ${lib.makeBinPath [ xdg-utils ]} \
      --add-flags "--enable-features=UseOzonePlatform --ozone-platform=wayland" # Optional: sensible defaults for modern Linux

    # Symlink vivaldi-stable to vivaldi to match Arch behavior
    ln -s $out/bin/vivaldi $out/bin/vivaldi-stable
  '';

  meta = with lib; {
    description = "An advanced browser made with the power user in mind";
    homepage = "https://vivaldi.com";
    license = licenses.unfree; # Vivaldi is proprietary
    platforms = [ "x86_64-linux" ];
    mainProgram = "vivaldi";
    maintainers = with maintainers; [ ]; # Add yourself if maintaining locally
  };
}
