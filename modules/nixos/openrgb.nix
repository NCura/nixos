{ config, pkgs, ... }:

let
  openrgb-rules-src = pkgs.fetchurl {
    url = "https://openrgb.org/releases/release_0.9/60-openrgb.rules";
    sha256 = "0f5bmz0q8gs26mhy4m55gvbvcyvd7c0bf92aal4dsyg9n7lyq6xp";
  };

  openrgb-rules = pkgs.runCommandNoCC "openrgb-udev-rules" {} ''
    mkdir -p $out
    cp ${openrgb-rules-src} $out/60-openrgb.rules
    substituteInPlace $out/60-openrgb.rules --replace "/bin/chmod" "${pkgs.coreutils}/bin/chmod"
  '';
in {
  boot.kernelModules = [ "i2c-dev" "i2c-piix4" ];
  services.udev.extraRules = pkgs.lib.readFile "${openrgb-rules}/60-openrgb.rules";
}
