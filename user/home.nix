{ pkgs, ... }:

{
  imports = [
    ../theme/theme.nix
  ];
  
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "sachin";
  home.homeDirectory = "/home/sachin";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  nixpkgs.config = {

    # allow unfree softwares
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    brightnessctl
    # discord
    foliate
    stremio
    nest-cli
    newsboat
    drawio
    file
    swaybg
    gum
    glow
    bat
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
   ".bashrc".source = ./bash/bashrc;
   ".zshrc".source = ./zsh/zshrc;
   
   ".config/nvim" = {
     source = ./nvim;
     recursive = true;
   };

    # kitty
   ".config/kitty" = {
     source = ./kitty;
     recursive = true;
   };

   # alacritty
   ".config/alacritty" = {
     source = ./alacritty;
     recursive = true;
   };

    ".config/bspwm" = {
     source = ./bspwm;
     recursive = true;
   };

   ".config/foot" = {
     source = ./foot;
     recursive = true;
   };

   ".config/lf" = {
     source = ./lf;
     recursive = true;
   };

   ".config/mako" = {
     source = ./mako;
     recursive = true;
   };

   ".config/mpd" = {
     source = ./mpd;
     recursive = true;
   };

   ".config/mpv" = {
     source = ./mpv;
     recursive = true;
   };

   ".config/ncmpcpp" = {
     source = ./ncmpcpp;
     recursive = true;
   };

   ".config/rofi" = {
     source = ./rofi;
     recursive = true;
   };

   # hyprland
   ".config/hypr" = {
     source = ./hypr;
     recursive = true;
   };

   # tmux
   ".config/tmux" = {
     source = ./tmux;
     recursive = true;
   };

   # waybar
   ".config/waybar" = {
    source = ./waybar;
    recursive = true;
   };

   ".config/shell" = {
     source = ./shell;
     recursive = true;
   };

   ".config/sxhkd" = {
     source = ./sxhkd;
     recursive = true;
   };

   ".config/sxiv" = {
     source = ./sxiv;
     recursive = true;
   };

   ".config/wayfire" = {
     source = ./wayfire;
     recursive = true;
   };

   ".local/bin" = {
    source = ./scripts;
    recursive = true;
   };
   ".local/bin/nixer".source = ../nixer;

   # custome 'gtk' colors
#   ".config/gtk-4.0/gtk.css".source = ../theme/gtk.css;
#   ".config/gtk-3.0/gtk.css".source = ../theme/gtk.css;

  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
