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
    networkmanager-openvpn
    openvpn 
    pulseaudio
    pavucontrol
    font-awesome                                                                                                                                                                            
    xfce.thunar                                                                                                                                                                       
    xfce.thunar-volman  
    wl-clipboard 
    grim
    slurp
    swappy  
    powertop
    brightnessctl                                                                                                                                                            
  ];                            
}

