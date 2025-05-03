{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "7zip";
  version = "24.09";

  src = pkgs.fetchurl {
    url = "https://www.7-zip.org/a/7z2409-linux-x64.tar.xz";
    sha256 = "sha256-kUx+IK1e+OTTzwhiD/iJSyj+EbfrmYCdaTCHD75IooE=";
  };

  sourceRoot = ".";

  installPhase = ''
    mkdir -p $out/bin
    cp -r 7zz $out/bin/
    chmod +x $out/bin/7zz
  '';

  meta = with pkgs.lib; {
    description = "7-Zip file archiver";
    homepage = "https://www.7-zip.org/";
    license = licenses.lgpl2Plus;
    platforms = platforms.linux;
  };
}

