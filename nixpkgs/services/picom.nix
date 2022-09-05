{ pkgs, ... }:
{
  services.picom = {
    enable = true;
    inactiveOpacity = 0.75;

    opacityRules = [
        "100:class_g = 'Google-chrome'"
        "100:class_g = 'Spotify'"
        "100:class_g = 'Slack'"
        "100:class_g = '.guvcview-wrapped'"
    ];

    shadowExclude = [
      "bounding_shaped && !rounded_corners"
    ];

    backend = "glx";
    experimentalBackends = true;

     settings = {
         animations = true;
         blur-background-exclude = [
             "class_g ~= 'Peek'"
             "class_g ~= 'peek'"
         ];
         corner-radius = 7;
         round-borders = 1;
         rounded-corners-exclude = [
             "class_g = 'dwm'"
         ];
         blur = {
             method = "dual_kawase";
             strength = 8;
         };
         xinerama-shadow-crop = true;
     };
    fade = true;
    fadeDelta = 5;
    vSync = true;

    package = pkgs.picom.overrideAttrs(o: {
      src = pkgs.fetchFromGitHub {
        repo = "picom";
        owner = "FT-Labs";
        rev = "795651dd74b268ea8578272ab4adc3a23a16ee80";
        sha256 = "0hkmypfvy8cc8ff05a12hzycylzdrl39j5kyir29srqbcmkc7m16";
      };
    });

    # package = pkgs.picom.overrideAttrs(o: {
    #   src = pkgs.fetchFromGitHub {
    #     repo = "picom";
    #     owner = "jonaburg";
    #     rev = "e3c19cd7d1108d114552267f302548c113278d45";
    #     sha256 = "19nglw72mxbr47h1nva9fabzjv51s4fy6s1j893k4zvlhw0h5yp2";
    #   };
    # });

    # package = pkgs.picom.overrideAttrs(o: {
    #   src = pkgs.fetchFromGitHub {
    #     repo = "picom";
    #     owner = "ibhagwan";
    #     rev = "982bb43e5d4116f1a37a0bde01c9bda0b88705b9";
    #     sha256 = "0iff4bwpc00xbjad0m000midslgx12aihs33mdvfckr75r114ylh";
    #   };
    # });

    # package = pkgs.picom.overrideAttrs(o: {
    #   src = pkgs.fetchFromGitHub {
    #     repo = "picom";
    #     owner = "pijulius";
    #     rev = "982bb43e5d4116f1a37a0bde01c9bda0b88705b9";
    #     sha256 = "04rji6a9qdih04qk3mc0bg8hj6c1ccdn28jk4gh4gxfmq14qnav2";
    #   };
    # });
  };
}
