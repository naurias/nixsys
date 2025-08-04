{
  config,
  pkgs,
  lib,
  ...
}: {
  environment.variables = {
    EDITOR = "emacsclient -c";
  };
}
