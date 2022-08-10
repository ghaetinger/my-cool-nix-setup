{ pkgs }: let

  dwmgaps = builtins.fetchurl {
    url = "https://dwm.suckless.org/patches/fullgaps/dwm-fullgaps-20200508-7b77734.diff";
    sha256 = "0yn3wq7xalhqfhh4v5q758n0pccwkqzayybzkqf1zjczq1r3rgzr";
  };

  floatrules = builtins.fetchurl {
    url = "https://dwm.suckless.org/patches/floatrules/dwm-floatrules-20210801-138b405.diff";
    sha256 = "0wvaxlqhsf3g63xck63a15swgd6g6jfwqh87rakz7mjqv4504n20";
  };

in
  pkgs.dwm.overrideAttrs (oldAttrs: rec {
    patches = [ dwmgaps floatrules ];
    configFile = pkgs.writeText "config.h" (builtins.readFile ./config.h);
    postPatch = oldAttrs.postPatch or "" + "\necho 'Using own config file...'\n cp ${configFile} config.def.h";
  })
