{ config, pkgs, ... }:

{
  services.httpd = {
    enable = true;
    adminAddr = "nicolas.cura@icloud.com";
    enablePHP = true;
  };
  services.httpd.phpPackage = pkgs.php82;
  environment.systemPackages = with pkgs; [
    php82
  ];
}