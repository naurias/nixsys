{
	prev
}:

prev.vivaldi.overrideAttrs (oldAttrs: rec {
				pname = oldAttrs.pname;
				version = "7.2.3621.67";

				src = prev.fetchurl {
				 url = "https://downloads.vivaldi.com/stable/vivaldi-stable_7.2.3621.67-1_amd64.deb";
				hash = "sha256-gDFDLc9RNI9Ktym9Jx6Xrdm9XKImOz+bHV5JadCc0Wo=";
				};

			})

