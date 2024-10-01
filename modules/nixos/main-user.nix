{
  users.users.nicolas = {
    isNormalUser = true;
    createHome = true;
    description = "Nicolas Cura";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
      "qemu-libvirtd"
      "libvirt"
      "kvm"
      "wwwrun"
      "uucp"
      "plugdev"
      "ydotool"
    ];
  };

  services.getty.autologinUser = "nicolas";
  nix.extraOptions = ''
    trusted-users = root nicolas
    extra-substituters = https://devenv.cachix.org;
    extra-trusted-public-keys = devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=;
  '';
}
