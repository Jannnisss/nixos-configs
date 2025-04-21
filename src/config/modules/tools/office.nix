{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    libreoffice    
  ];
}