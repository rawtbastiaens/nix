{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    betterlockscreen
  ];
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
}
