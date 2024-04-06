{
  description = "vladidobro homepage";

  inputs = {
    nixpkgs = {
      type = "github";
      owner = "NixOs";
      repo = "nixpkgs";
      ref = "nixpkgs-unstable";
    };
    flake-utils = {
      type = "github";
      owner = "numtide";
      repo = "flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
  flake-utils.lib.eachDefaultSystem (system:
    let pkgs = nixpkgs."${system}".legacyPackages;
    in with pkgs; {
      packages.site = stdenv.mkDerivation {
        name = "homepage";
        src = ./src;
        installPhase = ''
          mkdir -p $out/html
          echo "ahoj" > $out/html/index.html
        '';
      };
    }
  );
}
