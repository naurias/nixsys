# default.nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "ext";
  version = "1.0";

  src = ./.;

  nativeBuildInputs = [ pkgs.makeWrapper ];
  buildInputs = [ pkgs.p7zip ];

  installPhase = ''
    mkdir -p $out/bin
    cp ext.sh $out/bin/ext
    chmod +x $out/bin/ext
    wrapProgram $out/bin/ext --prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.p7zip ]}
  '';

  meta = {
    description = "A universal archive extractor using 7z";
    license = pkgs.lib.licenses.mit;
    platforms = pkgs.lib.platforms.unix;
  };
}

