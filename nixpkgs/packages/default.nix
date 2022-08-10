{ lib, stable, unstable }: let

  this_path = builtins.toString ./.;
  all_package_types = import ../aux/readAllFilesInDirectory.nix { lib=lib; directory=this_path; };

  # gui = import ./gui { stable=stable; unstable=unstable; };
  # tui = import ./tui { stable=stable; unstable=unstable; };
  # fonts = import ./fonts { stable=stable; unstable=unstable; };
  # programming = import ./programming { stable=stable; unstable=unstable; };

  package_list = map (path: import path { stable=stable; unstable=unstable; }) all_package_types;

in builtins.foldl' (l: p: l ++ p) [] package_list

  #gui ++ tui ++ programming ++ fonts
