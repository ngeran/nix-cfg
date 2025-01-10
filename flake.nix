{
  description = "Nixos config flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    stylix.url = "github:danth/stylix";
    nix-colors.url = "github:misterio77/nix-colors";
 #   hardware.url = "github:nix-systems/nixos-hardware"; 
    
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
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    user = "nikos"; 
    hostname = "vmware"; 
    hosts = [
      { hostname = "vmware"; stateVersion = "24.11";}
    ];
  in
  {
    inherit lib; 
    
    # NixOs Configuration
   nixosConfigurations = {
       # VMWARE 
       vmware = lib.nixosSystem {
          modules = [./hosts/vmware/configuration.nix];
          specialArgs = {
            inherit inputs outputs system;
          };
       };

        # ELITEDESK 
       elitedesk = lib.nixosSystem {
          modules = [./hosts/elitedesk/configuration.nix];
          specialArgs = {
            inherit inputs outputs system;
          };
       };
   };
 
    
    # Home Configuration 
    homeConfigurations = {
       #VMWARE
       "nikos" = lib.homeManagerConfiguration {
          modules = [ ./hosts/vmware/home.nix ];
          # Specify the host architecture
	        pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = {
              inherit inputs outputs;
          };
       };

        #HP ELITEDESK ( Workstation )
       "nikos2" = lib.homeManagerConfiguration {
          modules = [ ./home-manager/elitedesk.nix ];
          # Specify the host architecture
	        pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = {
              inherit inputs outputs;
          };
       };

    };

  };
}
