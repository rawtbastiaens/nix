
{pkgs, ...}: {
  home.packages = with pkgs; [
    thunderbird
    evolution
    evolution-ews
  ];
}
