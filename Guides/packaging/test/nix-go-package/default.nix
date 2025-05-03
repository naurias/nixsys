{
	buildGoModule,
	fetchFromGithub,
}:


buildGoModule rec {
    pname = "pet";
    version = "0.3.4";

    src = fetchFromGitHub {
      owner = "knqyf263";
      repo = "pet";
      rev = "v${version}";
      hash = "sha256-Gjw1dRrgM8D3G7v6WIM2+50r4HmTXvx0Xxme2fH9TlQ=";
    };

    vendorHash = "sha256-ciBIR+a1oaYH+H1PcC8cD8ncfJczk1IiJ8iYNM+R6aA=";

    meta = {
      description = "Simple command-line snippet manager, written in Go";
      homepage = "https://github.com/knqyf263/pet";
      license = lib.licenses.mit;
      maintainers = with lib.maintainers; [ kalbasit ];
    };
  
# then build nix build1

}
