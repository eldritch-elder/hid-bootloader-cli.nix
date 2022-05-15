{ pkgs ? import <nixpkgs> { } }:
pkgs.stdenv.mkDerivation rec {
  name = "hid_bootloader_cli";
  version = "072365807281dc715f9594725aede917b4562e94";
  src = pkgs.fetchFromGitHub {
    owner = "drashna";
    repo = "hid_bootloader_cli";
    rev = "072365807281dc715f9594725aede917b4562e94";
    hash = "sha256-WpBOsM/dbeiANeiIYwIvEGWq6n/+0AaCpQanGtBFwaI=";
  };
  patches = [ ./frejas-awesome-patch.diff ];
  #sourceRoot = "";
  buildInputs = with pkgs; [ libusb-compat-0_1 ];
  installPhase = ''
    export OS=LINUX
    make
    mkdir -p $out/bin
    install -m 755 hid_bootloader_cli $out/bin
  '';
}
