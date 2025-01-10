{ pkgs, ... }: {

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [

    # Desktop apps
#   inkscape-with-extensions
#    krita
    #kicad
#    dropbox
    #logseq has problem with - Electron version 27.3.11 is EOL
#     zathura
#     vlc

    # CLI utils
    code-cursor
    tree
    
    # Coding stuff
    nodejs
    cargo
    gnumake
    hugo 
    code-cursor
    foot
    # WM stuff
#    libsForQt5.xwaylandvideobridge
#    libnotify
#    xdg-desktop-portal-gtk
#    xdg-desktop-portal-hyprland

    # Other
    bat
    tailwindcss

  ];
}

