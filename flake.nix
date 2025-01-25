{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    chicago95 = {
      url = "github:grassmunk/Chicago95";
      flake = false;
    };
  };

  outputs = {nixpkgs, chicago95, ...}: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system}.gtk = pkgs.stdenv.mkDerivation {
      name = "chicago95-gtk-theme";
      src = chicago95;

      dontBuild = true;

      installPhase = ''
        mkdir -p $out/share/themes
        cp -r ./Theme/Chicago95 $out/share/themes
      '';
    };
  };
}
