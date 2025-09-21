{ lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "ripgrep";
  version = "12.1.1";

  src = fetchFromGitHub {
    owner = "BurntSushi";
    repo = pname;
    rev = version;
    hash = "sha256-+s5RBC3XSgb8omTbUNLywZnP6jSxZBKSS1BmXOjRF8M=";
  };

  cargoHash = "sha256-jtBw4ahSl88L0iuCXxQgZVm1EcboWRJMNtjxLVTtzts=";

  meta = {
    description = "Fast line-oriented regex search tool, similar to ag and ack";
    homepage = "https://github.com/BurntSushi/ripgrep";
    license = lib.licenses.unlicense;
    maintainers = [ ];
  };
}
