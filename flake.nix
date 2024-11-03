{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = inputs @ {
    self,
    nixpkgs,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in rec {
    apps.${system}.default = {
      type = "app";
      program = packages.${system}.default + "/bin/flax2";
    };
    packages.${system}.default = pkgs.stdenv.mkDerivation {
      name = "flax2";
      src = ./.;
      buildCommand = ''
        mkdir -p $out/bin/
        cp -ai $src $out/src

        echo "#!/usr/bin/env bash" > $out/bin/flax2
        echo 'cd $(dirname $0)/../src; ahk.exe flax2.ahk' >> $out/bin/flax2
        chmod 744 $out/bin/*
      '';
    };
  };
}
