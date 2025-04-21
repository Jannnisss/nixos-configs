{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    r2modman    
  ];
}