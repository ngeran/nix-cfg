{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    neovim
    git
    kitty
    alacritty
    wget
    unzip
    firefox
    rofi-wayland                                                                                                                                                    
    ags                                                                                                                                                                               
    openssh
    hugo                                                                                                                                                                              
    neofetch                                                                                                                                                                          
    btop 
    font-awesome                                                                                                                                                                            
    xfce.thunar                                                                                                                                                                       
    xfce.thunar-volman  
    wl-clipboard 
    grim
    slurp
    swappy  
  ];                            
}

