{
  ".config/alacritty/alacritty.yml".text = builtins.readFile ./alacritty/alacritty.yml;

  ".config/rofi/config.rasi".text = builtins.readFile ./rofi/config.rasi;

  ".xprofile".text =  builtins.readFile ./profile/xprofile.sh;

  ".emacs.d/init.el".text = builtins.readFile ./emacs/init.el;
  ".doom.d/init.el".text = builtins.readFile ./emacs/doom-init.el;
  ".doom.d/config.el".text = builtins.readFile ./emacs/doom-config.el;
  ".doom.d/packages.el".text = builtins.readFile ./emacs/doom-packages.el;
}
