{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation rec {
  name = "hid_bootloader_cli";
  version = "fa2cc3e1c3abab7c971506bd86ca4e28ecc7d288";
  src = pkgs.fetchFromGitHub {
    owner = "abcminiuser";
    repo = "lufa";
    rev = "fa2cc3e1c3abab7c971506bd86ca4e28ecc7d288";
    sha256 = "sha256-L5GsIJx5Il9Oc7HKBxZEawL32w7yozCPQJ7NGDU+mXo=";
  };
  sourceRoot = "source/Bootloaders/HID/HostLoaderApp";
  buildInputs = [pkgs.libusb-compat-0_1];
  installPhase = ''
    mkdir -p $out/bin
    install -m 755 hid_bootloader_cli $out/bin
  '';
}  