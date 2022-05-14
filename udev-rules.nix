{ pkgs ? import <nixpkgs> { } }:
pkgs.stdenv.mkDerivation {
  name = "udev-qmk-rules";
  src = ./.;

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    mkdir -p $out/lib/udev/rules.d
    cp 50-qmk.rules $out/lib/udev/rules.d/50-qmk.rules
  '';
}
