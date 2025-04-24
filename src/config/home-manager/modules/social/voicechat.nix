{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.packages = with pkgs; [
    vesktop
  ];
}
