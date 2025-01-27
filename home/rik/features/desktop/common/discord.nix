{pkgs, ...}: {
  home.packages = with pkgs; [
    vesktop # third party with better linux support
    discord
  ];
}
