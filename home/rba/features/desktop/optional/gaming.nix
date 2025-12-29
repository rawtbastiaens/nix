
{pkgs, ...}: {
  home.packages = with pkgs; [
    prismlauncher # minecraft
    lutris
    heroic # Epic Games
    bottles # 
    mangohud
  ];

  programs = {
    # steam = {
    #   enable = true;
    #   gamescopeSession = {
    #     enable = true;
    #   };
    # };
    # gamemode = {
    #   enable = true;
    # };
  };

}
