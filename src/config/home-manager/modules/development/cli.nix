{ config, pkgs, inputs, nixpkgs, ... }:

{

  home.packages = with pkgs; [
    tree
  ];

} 