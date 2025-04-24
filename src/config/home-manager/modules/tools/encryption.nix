{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.packages = with pkgs; [
    veracrypt
    yubioath-flutter
  ];
}
