{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    veracrypt
    yubioath-flutter
  ];
}