{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    font-awesome_6
    font-awesome_5
    font-awesome_4
  ];
}

