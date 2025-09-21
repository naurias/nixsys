{
	vivaldi,
	fetchurl,
}:

vivaldi.overrideAttrs (oldAttrs: rec {
	pname = oldAttrs.pname;
	version = "7.6.3797.52";

	src = fetchurl {
   url = "https://downloads.vivaldi.com/stable/vivaldi-stable_7.6.3797.52-1_amd64.deb";
   hash = "sha256-gDFDLc9RNI9Ktym9Jx6Xrdm9XKImOz+bHV5JadCc0Wo=";
  };

})
