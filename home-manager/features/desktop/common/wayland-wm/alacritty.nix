{config, ...}: {
  # Set as default terminal
  xdg.mimeApps = {
    associations.added = {
      "x-scheme-handler/terminal" = "Alacritty.desktop";
    };
    defaultApplications = {
      "x-scheme-handler/terminal" = "Alacritty.desktop";
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = config.fontProfiles.monospace.size;
        normal = {
          family = config.fontProfiles.monospace.name;
          style = "Medium";
        };
      };
      window = {
        padding = {
          x = 24;
          y = 26;
        };
      };
      colors = rec {
        primary = {
          background = config.colorscheme.colors.surface;
          foreground = config.colorscheme.colors.on_surface;
        };
        normal = {
          black = config.colorscheme.colors.surface_dim;
          white = config.colorscheme.colors.on_surface;
          red = config.colorscheme.colors.red;
          green = config.colorscheme.colors.green;
          yellow = config.colorscheme.colors.yellow;
          blue = config.colorscheme.colors.blue;
          magenta = config.colorscheme.colors.magenta;
          cyan = config.colorscheme.colors.cyan;
        };
        # TODO make actual bright variants
        bright = normal // {
          black = config.colorscheme.colors.on_surface_variant;
        };
      };
    };
  };
}
