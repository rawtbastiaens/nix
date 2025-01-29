{
  users.users = {
    rba = {
      isNormalUser = true;
      description = "Rik Bastiaens";
      extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" ];
      shell = pkgs.zsh;
      packages = with pkgs; [];
    };
  };
}
