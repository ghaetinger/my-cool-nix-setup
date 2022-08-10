{ lib, ... }: let
  this_path = builtins.toString ./.;
  all_services = import ../aux/readAllFilesInDirectory.nix { lib=lib; directory=this_path; };
in all_services
