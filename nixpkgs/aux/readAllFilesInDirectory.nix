{ lib, directory }: with lib; let
  getDir = dir: mapAttrs
    (file: type: type)
    (builtins.readDir dir);

  files = dir: collect isString (mapAttrsRecursive (path: type: concatStringsSep "/" path) (getDir dir));

  validFiles = dir: map
    (file: directory + "/${file}")
    (filter
      (file: file != "default.nix")
      (files dir));

in validFiles directory
