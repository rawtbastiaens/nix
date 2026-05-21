{ inputs, pkgs, ... }:
let
  terminal = "kitty";
  fileManager = "kitty -e yazi";
  menu = "rofi -show combi";
  browser = "firefox";
  screenshot = ''grim -g "$(slurp)" - | swappy -f -'';
  cliphist_store = "wl-paste --watch cliphist store";
  cliphist_pick = "cliphist list | wofi -S dmenu | cliphist decode | wl-copy";
  waybar = "systemctl start --user waybar";
  hypr-monitor-switch = pkgs.callPackage ../../../../../pkgs/hypr-monitor-switch { };
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprexpo
    ];

    settings = {
      "$mainMod" = "SUPER";

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      exec-once = [
        "nm-applet &"
        "hyprpaper"
        "ferdium"
        "keepassxc"
        cliphist_store
        waybar
      ];

      general = {
        gaps_in = 10;
        gaps_out = 32;
        border_size = 0;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "master";
      };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          "color" = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = "yes, please :)";

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      dwindle = {
        preserve_split = true;
      };

      master = {
        new_status = "master";
        new_on_top = true;
        orientation = "center";
        mfact = 0.55;
        smart_resizing = false;
        slave_count_for_center_master = 0;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0.2;
        accel_profile = "adaptive";

        touchpad = {
          natural_scroll = false;
        };
      };

      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      # windowrule = [
      #   "rounding 0, bordersize 0, onworkspace:7"
      #   "size 50% 50%,class:^(org.keepassxc.KeePassXC)$"
      #   "center on,class:^(org.keepassxc.KeePassXC)$"
      #   "float,class:^(org.keepassxc.KeePassXC)$"
      #   "workspace 8, class:^(org.keepassxc.KeePassXC)$"
      #   "workspace 9, class:^(Ferdium)$"
      #   "suppressevent maximize, class:.*"
      #   "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      # ];

      bind = [
        "$mainMod, TAB, hyprexpo:expo, toggle"
        "$mainMod SHIFT, F, fullscreen"
        "$mainMod, Q, exec, ${terminal}"
        "$mainMod, F, exec, ${browser}"
        "$mainMod, escape, exec, hyprlock"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, ${fileManager}"
        "$mainMod SHIFT, B, exec, pkill -SIGUSR2 waybar"
        "$mainMod SHIFT, P, exec, ${screenshot}"
        "$mainMod SHIFT, C, exec, ${cliphist_pick}"
        "$mainMod SHIFT, M, exec, hypr-monitor-switch"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, ${menu}"
        "$mainMod, P, pseudo,"
        "$mainMod SHIFT, J, layoutmsg, swapwithmaster master,"

        "$mainMod, period, focusmonitor, r"
        "$mainMod, comma, focusmonitor, l"
        "$mainMod SHIFT, period, movecurrentworkspacetomonitor, r"
        "$mainMod SHIFT, comma, movecurrentworkspacetomonitor, l"

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, l, movewindow, r"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, j, movewindow, d"
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, amixer set Master 5%+"
        ",XF86AudioLowerVolume, exec, amixer set Master 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", switch:off:Lid Switch, exec, hyprctl keyword monitor \"eDP-1, 1920x1080, 0x0, 1\""
        ", switch:on:Lid Switch, exec, hyprctl keyword monitor \"eDP-1, disable\""
      ];
      plugin = {
        hyprexpo = {
          columns = 3;
          gap_size = 5;
          # bg_col = "rgb (111111)";
          workspace_method = "first 1";
        };
      };
    };
  };

  home.packages = [
    inputs.snappy-switcher.packages.${pkgs.system}.default
    hypr-monitor-switch
    pkgs.nwg-displays
  ];

  programs.rofi = {
    enable = true;
    font = "Noto Sans 12";
    terminal = "\${pkgs.kitty}/bin/kitty";
    extraConfig = {
      modi = "drun,run,window,ssh,combi";
    };
    theme = "material";
  };

  services.kanshi = {
    enable = true;
    systemdTarget = "hyprland-session.target";
    settings = [
      {
        profile.name = "two-screen-office";
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "disable";
          }
          {
            criteria = "DP-5";
            status = "enable";
            mode = "2560x1440@60Hz";
            position = "1920,0";
            scale = 1.0;
          }
          {
            criteria = "HDMI-A-1";
            status = "enable";
            mode = "2560x1440@60Hz";
            position = "4480,0";
            scale = 1.0;
          }
        ];
      }
      {
        profile.name = "undocked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
            mode = "1920x1080@60Hz";
            scale = 1.0;
          }
        ];
      }
      {
        profile.name = "home";
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "disable";
          }
          {
            criteria = "Samsung Electric Company LC34G55T HNBX800474";
            mode = "3440x1440@60Hz";
          }
        ];
      }
      {
        profile.name = "office";
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "disable";
          }
          {
            criteria = "HDMI-A-1";
            mode = "3440x1440@60Hz";
          }
        ];
      }
    ];
  };

}
