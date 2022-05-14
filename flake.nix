{
  description = "tiny flake for hid_bootloader_cli";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils, ... }@attrs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        rules = pkgs.callPackage ./udev-rules.nix { inherit pkgs; };
      in {
        packages.default = import ./default.nix { inherit pkgs; };
        services.udev.packages = [ rules ];
      });
}
