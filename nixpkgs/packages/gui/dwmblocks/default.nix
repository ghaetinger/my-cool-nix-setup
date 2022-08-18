{ config, lib, pkgs, ... }:

pkgs.dwmblocks.overrideAttrs (oldAttrs: rec {
  configFile = pkgs.writeText "blocks.def.h" (builtins.readFile ./config.h);
  postPatch = oldAttrs.postPatch or "" + "\necho 'Using own config file...'\n cp ${configFile} blocks.def.h";
})
