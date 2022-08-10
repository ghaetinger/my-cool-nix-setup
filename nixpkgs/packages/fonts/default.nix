{ stable, unstable }: let
  mononoki = import ./mononoki.nix { stable=stable; unstable=unstable; };
in with stable; [
  emacs-all-the-icons-fonts
  fira-code
  fira-code-symbols
  font-awesome
  iosevka
  jetbrains-mono
  mononoki
  terminus_font_ttf
]
