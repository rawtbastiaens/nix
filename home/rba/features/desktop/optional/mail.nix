
{pkgs, ...}: {
  home.packages = with pkgs; [
    evolution
    evolution-ews
  ];
}
