{ pkgs, ...}:

{

# enable xserver
services.xserver.enable = true;

# enable display manager
services.xserver.displayManager = { 
  sddm.enable = true;
  sddm.wayland.enable = true;
  defaultSession = "hyprland";
  sddm.theme = "chili";
  sddm.settings = {
    Theme = {
      Current = "chili";
      ThemeDir = "/run/current-system/sw/share/sddm/themes";
      FacesDir = "/run/current-system/sw/share/sddm/faces";
    };
  };
};

}
