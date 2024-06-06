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
}
