{
  programs.git = {
    enable = true;
    userName = "Nicolas Cura";
    userEmail = "nicolas.cura@icloud.com";
    extraConfig.safe.directory = [
      "/home/nicolas/Documents/WordPress/st-patrimoine.com/staging_html/wp-content/plugins/st-plugin"
      "/var/lib/www/staging.st-patrimoine.com/wp-content/plugins/st-plugin"
    ];
  };
}
