{ inputs, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprexpo
      inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprbars
    ];
  };

  home.packages = with pkgs; [
    thunar
  ];

  # Kanshi -> automated display config (like autorandr)
  services.kanshi = {
    enable = true;
    systemdTarget = "hyprland-session.target";

    profiles = {
      undocked = {
        outputs = [
          {
            criteria = "eDP-1";
            scale = 1.0;
            status = "enable";
          }
        ];
      };

      home = {
        outputs = [
          {
            criteria = "Samsung Electric Company LC34G55T HNBX800474";
            position = "0,0";
            mode = "3440x1440@60Hz";
          }
          {
            criteria = "eDP-1";
            mode = "disable";
          }
        ];
      };
    };
  };

}
