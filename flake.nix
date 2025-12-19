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
      applyIncludeAll = ahkPath: (pkgs.writeTextFile {
        name = builtins.baseNameOf ahkPath;
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
          (builtins.readFile ahkPath);
      });
      rawBody = builtins.readFile ./flax2.ahk;
      resolveIncludeRemote = ahkPath: let
        infos = pkgs.lib.pipe ahkPath [
          builtins.readFile
          (builtins.split "@include-remote ([^@ ]+) ([^@ ]+) ?([^@ ]+)?@(\n|$)")
          (builtins.filter (e: builtins.typeOf e == "list"))
          (builtins.map (list: {
            name = builtins.elemAt list 0;
            path = builtins.elemAt list 1;
            hash = builtins.elemAt list 2;
          }))
          (builtins.map ({
            name,
            path,
            hash,
          }: {
            inherit name;
            from =
              "@include-remote ${name} ${path}"
              + (
                if hash == null
                then ""
                else " ${hash}"
              )
              + "@";
            to = ''#include "remote\${name}.ahk"'';
            file =
              if (builtins.match ".+://.+" path) != null
              then
                pkgs.fetchurl {
                  inherit hash;
                  url = path;
                }
              else builtins.toFile (builtins.baseNameOf path) (builtins.readFile path);
          }))
        ];
      in {
        inherit infos;
        file = pkgs.writeTextFile {
          name = builtins.baseNameOf ahkPath;
          text =
            builtins.replaceStrings
            (builtins.map ({from, ...}: from) infos)
            (builtins.map ({to, ...}: to) infos)
            (builtins.readFile ahkPath);
        };
      };
      resolved = resolveIncludeRemote (applyIncludeAll ./flax2.ahk);
    in
      pkgs.stdenv.mkDerivation {
        name = "flax2";
        src = ./.;
        buildCommand = ''
          mkdir -p $out/bin/
          cp -ai $src $out/src

          chmod -R 744 $out/src

          mkdir $out/src/remote
          ${pkgs.lib.pipe (resolved.infos) [
            (builtins.map ({
              name,
              file,
              ...
            }: ''ln -s ${file} $out/src/remote/${name}.ahk''))
            (builtins.concatStringsSep "\n")
          ]}

          rm $out/src/flax2.ahk
          ln -s ${resolved.file} $out/src/flax2.ahk

          echo "#!/usr/bin/env bash" > $out/bin/flax2
          echo 'cd $(dirname $0)/../src; gsudo.exe "$(wslpath -w "$(readlink -f "$(which ahk.exe)")")" flax2.ahk' >> $out/bin/flax2
          chmod 744 $out/bin/*
        '';
      };
  };
}
