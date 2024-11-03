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
    packages.${system}.default = let
      dirs = pkgs.lib.pipe (builtins.readDir ./.) [
        (
          pkgs.lib.mapAttrsToList (
            path: type:
              if type == "directory"
              then path
              else null
          )
        )
        (builtins.filter (value: value != null))
      ];
      substituted = pkgs.writeTextFile {
        name = "flax2.ahk";
        text =
          builtins.replaceStrings
          (builtins.map (dir: "@include-all ${dir}@") dirs)
          (builtins.map (dir:
            pkgs.lib.pipe (builtins.readDir ./${dir}) [
              (
                pkgs.lib.mapAttrsToList (
                  path: type:
                    if type != "directory" && (pkgs.lib.strings.hasSuffix ".ahk" path)
                    then ''#Include "${dir}\${path}"''
                    else null
                )
              )
              (builtins.filter (value: value != null))
              (builtins.concatStringsSep "\n")
            ])
          dirs)
          (builtins.readFile ./flax2.ahk);
      };
    in
      pkgs.stdenv.mkDerivation {
        name = "flax2";
        src = ./.;
        buildCommand = ''
          mkdir -p $out/bin/
          cp -ai $src $out/src

          chmod -R 744 $out/src
          rm $out/src/flax2.ahk
          ln -s ${substituted} $out/src/flax2.ahk

          echo "#!/usr/bin/env bash" > $out/bin/flax2
          echo 'cd $(dirname $0)/../src; ahk.exe flax2.ahk' >> $out/bin/flax2
          chmod 744 $out/bin/*
        '';
      };
  };
}
