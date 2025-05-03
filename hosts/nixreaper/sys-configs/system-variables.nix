{
  config,
  pkgs,
  lib,
  ...
}: {
  environment.variables = {
    EDITOR = "nvim";
  };
}
