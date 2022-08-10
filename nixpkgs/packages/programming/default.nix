{ stable, unstable }: let
  lsp-servers = import ./lsp-servers.nix { stable=stable; unstable=unstable; };
  tools = import ./tools.nix { stable=stable; unstable=unstable; };
in lsp-servers ++ tools
