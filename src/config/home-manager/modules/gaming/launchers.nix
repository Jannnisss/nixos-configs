{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.packages = with pkgs; [
    lutris
    prismlauncher
    modrinth-app
  ];
}
