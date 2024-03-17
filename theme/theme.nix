# theme.nix
{ pkgs, ... }:
#let 
#  tokyonight = import ./tokyonight.nix { inherit pkgs; };
#in
{

# enable gtk
gtk.enable = true;

gtk.cursorTheme.package = pkgs.bibata-cursors;
gtk.cursorTheme.name = "Bibata-Modern-Ice";
gtk.cursorTheme.size = 16;

gtk.font.package = pkgs.jetbrains-mono;
gtk.font.name = "JetBrainsMono Nerd Font Mono";
gtk.font.size = 10;

# gtk.theme.package = pkgs.adw-gtk3;
# gtk.theme.name = "adw-gtk3";
gtk.theme.package = pkgs.materia-theme;
gtk.theme.name = "Materia-dark-compact";

gtk.iconTheme.package = pkgs.papirus-icon-theme;
gtk.iconTheme.name = "Papirus-Dark";

# enable qt
qt.enable = true;

# platform theme 'gnome' or 'gtk'
qt.platformTheme = "gtk";

# name of qt theme
qt.style.name = "adwaita-dark";

# package to use
qt.style.package = pkgs.adwaita-qt;

}
