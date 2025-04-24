{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.packages = with pkgs; [
    r2modman
  ];
}
