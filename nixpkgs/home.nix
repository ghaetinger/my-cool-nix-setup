{ config, pkgs, lib, runCommand, ... }:

let
  unstable = import <nixpkgs-unstable> { config = { allowUnfree = true; }; };
  packages = import ./packages { lib=lib; stable=pkgs; unstable=unstable; };
  services = import ./services { lib=lib; };
  dotfiles = import ./dotfiles;
in {

  programs.home-manager.enable = true;
  home.username = "dewey";
  home.homeDirectory = "/home/dewey";
  home.stateVersion = "22.05";

  home.file = dotfiles;

  imports = services;

  home.packages = packages;
}
