{pkgs,...}:{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    profileExtra = ''
      # Login shell
           if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
             exec Hyprland
           fi
    '';
    bashrcExtra = ''
      # All shells
           if [ -f $HOME/.ssh/github ]; then
             eval "$(ssh-agent -s)" > /dev/null
             ssh-add ~/.ssh/github &> /dev/null
           fi
    '';
    initExtra = ''
        # Interactive shell
        neofetch
        # export NIX_LD=$(nix eval --impure --raw --expr 'let pkgs = import <nixpkgs> {}; NIX_LD = pkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker"; in NIX_LD')
    '';
  };
}

