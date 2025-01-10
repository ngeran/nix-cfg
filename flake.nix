{
  description = "Nixos config flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    stylix.url = "github:danth/stylix";
    nix-colors.url = "github:misterio77/nix-colors";
    
    hyprland-plugins = {
	url = "github:hyprwm/hyprland-plugins";
	inputs.hyprland.follows = "hyprland";
    };

     home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    user = "nikos"; 
    hostname = "vmware"; 
    hosts = [
      { hostname = "vmware"; stateVersion = "24.11";}
    ];
  in
  {
    # NixOs Configuration
    nixosConfigurations.vmware = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs system;};
      modules = [
        ./hosts/${hostname}/configuration.nix
      ];
    };
    
    # Home Configuration 
    homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
    	# Specify the host architecture
	pkgs = nixpkgs.legacyPackages.${system};

 	extraSpecialArgs = { inherit inputs; };
	# Specify your home configuration modules here
	modules = [
           ./hosts/${hostname}/home.nix
	];
    };
  };
  
}
