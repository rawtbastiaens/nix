{
  lib,
  writeShellApplication,
  hyprland,
  wofi,
  jq,
  libnotify,
}:

writeShellApplication {
  name = "hypr-monitor-switch";

  runtimeInputs = [
    hyprland
    wofi
    jq
    libnotify
  ];

  text = builtins.readFile ./hypr-monitor-switch.sh;

  meta = with lib; {
    description = "Wofi-based monitor layout switcher for Hyprland";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
