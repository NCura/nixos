{pkgs, ...}: {
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

  environment.systemPackages = with pkgs; [
    php83
    php
  ];

  services.httpd = {
    enable = true;
    enablePHP = true;
    phpOptions = ''
      upload_max_filesize = 100M
      post_max_size = 128M
    '';
    virtualHosts = {
      "localhost" = {
        documentRoot = "/var/lib/www/localhost";
        extraConfig = ''
          DirectoryIndex index.php
        '';
      };
      "staging.nicolascura.com.local" = {
        documentRoot = "/var/lib/www/staging.nicolascura.com";
        extraConfig = ''
          DirectoryIndex index.php
          <Directory "/var/lib/www/staging.nicolascura.com">
            AllowOverride All
            Require all granted
            Options +FollowSymLinks
          </Directory>
        '';
      };
      "immo.com.local" = {
        documentRoot = "/home/nicolas/projects/wordpress/immo.com";
        extraConfig = ''
          DirectoryIndex index.php
          <Directory "/home/nicolas/projects/wordpress/immo.com">
            AllowOverride All
            Require all granted
            Options +FollowSymLinks
          </Directory>
        '';
      };
      "staging.st-patrimoine.com.local" = {
        documentRoot = "/var/lib/www/staging.st-patrimoine.com";
        extraConfig = ''
          DirectoryIndex index.php
          <Directory "/var/lib/www/staging.st-patrimoine.com">
            AllowOverride All
            Require all granted
            Options +FollowSymLinks
          </Directory>
        '';
      };
      "staging.st-patrimoine2.com.local" = {
        documentRoot = "/var/lib/www/staging.st-patrimoine.com";
        extraConfig = ''
          DirectoryIndex index.php
          <Directory "/var/lib/www/staging.st-patrimoine.com">
            AllowOverride All
            Require all granted
            Options +FollowSymLinks
          </Directory>
        '';
      };
      "test-wordpress.com.local" = {
        documentRoot = "/var/lib/www/test-wordpress.com";
        extraConfig = ''
          DirectoryIndex index.php
          <Directory "/var/lib/www/test-wordpress.com">

            AllowOverride All
            Require all granted
            Options +FollowSymLinks
          </Directory>
        '';
      };
    };
  };

  networking.hosts = {
    "127.0.0.1" = [
      "staging.nicolascura.com.local"
      "staging.st-patrimoine.com.local"
      "immo.com.local"
      "test-wordpress.com.local"
    ];
  };
}
