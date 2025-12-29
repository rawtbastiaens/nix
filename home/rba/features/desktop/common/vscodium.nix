{
  pkgs,
  lib,
  ...
}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          vscodevim.vim
        ];
        keybindings = [
          {
            key = "ctrl+p";
            command = "workbench.action.quickOpen";
          }
        ];
      };
    };
  };
}
