{ lib, config, pkgs, ... }:

{
  options = {

  };

  config = {
    users.users.nicolas = {
      isNormalUser = true;
      createHome = true;
      description = "Nicolas Cura";
      extraGroups = [ "networkmanager" "wheel" "libvirtd" "qemu-libvirtd" "libvirt" "kvm" ];
      packages = [];
    };
  };
}
