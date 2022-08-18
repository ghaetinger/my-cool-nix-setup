{ stable, unstable }: let
  dwm_patched = stable.callPackage ./dwm { };
  dwmblocks_patched = stable.callPackage ./dwmblocks { };
in with stable; [
    alacritty
    emacs
    eww
    flameshot
    google-chrome
    guvcview
    i3lock
    nitrogen
    pavucontrol
    peek
    rofi
    simplescreenrecorder
    slack
    spotify
    tdesktop
    zathura

    # Patches
    dwm_patched
    dwmblocks_patched
]
