{
  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Mocha";
    font.name = "JetBrains Mono";
    font.size = 14;
    settings = {
      scrollback_lines = 2000;
      wheel_scroll_min_lines = 1;
      window_padding_width = 0;
      confirm_os_window_close = 0;
      background_opacity = "1.00";
    };
    keybindings = {
      # "ctrl+c" = "copy_or_interrupt";
      # "ctrl+v" = "paste_from_clipboard";
    };
    extraConfig = ''
      tab_bar_style fade
      tab_fade 1
      active_tab_font_style   bold
      inactive_tab_font_style bold
    '';
  };
}
