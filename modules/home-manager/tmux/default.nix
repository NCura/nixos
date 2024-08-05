{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    # customPaneNavigationAndResize = true;
    # disableConfirmationPrompt = true;
    extraConfig = ''
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf
    '';
    keyMode = "vi";
    mouse = true;
    # plugins = with pkgs; [
    #   tmuxPlugins.cpu
    #   {
    #     plugin = tmuxPlugins.resurrect;
    #     extraConfig = "set -g @resurrect-strategy-nvim 'session'";
    #   }
    #   {
    #     plugin = tmuxPlugins.continuum;
    #     extraConfig = ''
    #       set -g @continuum-restore 'on'
    #         set -g @continuum-save-interval '60' # minutes
    #     '';
    #   }
    # ];
    reverseSplit = true;
    # shortcut = "b";
    # prefix = "M-C-t";
  };
}
