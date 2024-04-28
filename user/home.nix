{ config, pkgs, pkgs-stable, ... }:
let 
nvim-config = "kick";
in
{
  imports = [
    ../theme/theme.nix
  ];

# Home Manager needs a bit of information about you and the paths it should
# manage.
  home.username = "sachin";
  home.homeDirectory = "/home/sachin";

#  programss.git = {
#    enable = true;
#    userName = "holesachin";
#    userEmail = "user@gmail.com";
#  };



# Sway
  wayland.windowManager.sway.enable = true;
  wayland.windowManager.sway.xwayland = true;


# You should not change this value, even if you update Home Manager. If you do
# want to update the value, then make sure to first check the Home Manager
# release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

    programs.zsh = {
      zplug = {
        enable = true;
        plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
        { name = "marlonrichert/zsh-autocomplete"; }
        ];
      };
    };

  nixpkgs.config = {

# allow unfree softwares
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  xdg.userDirs.enable = true;
  xdg.userDirs.createDirectories = true;
  xdg.userDirs = {
    music       = "${config.home.homeDirectory}/music";
    videos      = "${config.home.homeDirectory}/videos";
    documents   = "${config.home.homeDirectory}/docs";
    download    = "${config.home.homeDirectory}/download";
    publicShare = "${config.home.homeDirectory}/public";
    templates   = "${config.home.homeDirectory}/templates";
    pictures    = "${config.home.homeDirectory}/pix";
    desktop     = "${config.home.homeDirectory}/desktop";
  };

# The home.packages option allows you to install Nix packages into your
# environment.
  home.packages = (with pkgs; [
      #android-studio
      async
      bat
      brightnessctl
      bun
      cinnamon.nemo
      discord
      drawio
      fastfetch
      file
      freshfetch
      foliate
      glow
      gum
      gh
      hyprland
      hyprlock
      hypridle
      hyprshot
      hyprpicker
      maven
      nb
      nest-cli
      newsboat
      nodePackages.pnpm
      nodePackages.eslint
      nwg-displays
      nwg-wrapper
      nwg-panel
      nwg-hello
      nwg-drawer
      obsidian
      obs-studio
      nomacs
      prisma-engines
      pulsemixer
      pkg-config
      postman   
      prettierd
      pgweb
      rclone
      rustup
      stremio
      swaylock-effects
      swaylock-fancy
      swaybg
      scrcpy
      sxiv
      static-web-server
      vscode
      yad
      yt-dlp
      ytfzf
      zathura
      ])
      ++
      (with pkgs-stable; [
      ]);


# Home Manager is pretty good at managing dotfiles. The primary way to manage
# plain files is through 'home.file'.
  home.file = {
    ".bashrc".source = ./bash/bashrc;
    ".zshrc".source = ./zsh/zshrc;

# ".config/nvim" = {
#   source = ./nvim/${nvim-config};
#   recursive = true;
# };

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

    ".config/swaylock" = {
      source = ./swaylock;
      recursive = true;
    };

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
