{ stable, unstable }: let
in with stable; [
  emacs-all-the-icons-fonts
  fira-code
  fira-code-symbols
  font-awesome
  iosevka
  (nerdfonts.override { fonts = [ "Mononoki" ]; })
  terminus_font_ttf
]
