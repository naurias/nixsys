{ prev }:

prev.vivaldi.overrideAttrs (oldAttrs: rec {
  pname = oldAttrs.pname;
  version = "7.7.3851.52";

  src = prev.fetchurl {
    url = "https://downloads.vivaldi.com/stable/vivaldi-stable_7.7.3851.52-1_amd64.deb";
    hash = "sha256-dfKDGPCkjbw5SyxQXwolbjbm+VAXsLnOlCMSVoexFlc=";
  };

  # Add extra dependencies
  propagatedBuildInputs = (oldAttrs.propagatedBuildInputs or []) ++ [
    prev.vivaldi-ffmpeg-codecs
    prev.hicolor-icon-theme
  ];
})

