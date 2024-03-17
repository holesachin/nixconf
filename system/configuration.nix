# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./display-manager.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.nameservers = [
    "8.8.8.8"
    "1.1.1.1"
  ];
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sachin = {
    isNormalUser = true;
    description = "Sachin Adinath Hole";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  users.defaultUserShell = pkgs.bash;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # FIXME: this is exporimental
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Wayfire
  programs.wayfire.enable = true;
  programs.wayfire.plugins = with pkgs.wayfirePlugins; [
    wcm
    wf-shell
    wayfire-plugins-extra
  ];

  # Hyprland
  programs.hyprland.enable = true;
  programs.dconf.enable = true;
 
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    home-manager # nixos
    waybar
    hyprpaper
    hyprpicker
    mako
    xdg-utils 
    xdg-desktop-portal-hyprland
    sddm-chili-theme
    wl-clipboard

    # language and tools
    gcc
    clang
    zig
    go
    rustc
    cargo
    nodejs_18
    yarn
    stylua
    gnumake
    luajitPackages.luarocks
    python3
    python311Packages.pip

    tree-sitter
    pass-wayland
    neovim
    tmux
    alacritty
    kitty
    foot
    lazygit
    curl
    wget
    aria2
    lf
    brightnessctl
    
    git
    unzip
    ripgrep
    fd

    vscode
    lazygit
    firefox
    google-chrome
    zoom-us
    pcmanfm
    wofi
    rofi-wayland
    htop
    glances
    pavucontrol
    pulsemixer
    papirus-icon-theme
    materia-theme
    jetbrains-mono
    nerdfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    lxappearance
    libsForQt5.qt5ct
#    libsForQt5.qt5.qtquickcontrols2   
#    libsForQt5.qt5.qtgraphicaleffects
    nwg-displays
#    nwg-look
    networkmanagerapplet
    usbutils
    fzf
    bat
    trash-cli
    zoxide
    jq
    zsh
    wlr-randr
    sxiv
    mpv
    mpd
    mpc-cli
  ];

  programs.zsh = {
  enable = true;
  enableCompletion = true;
  autosuggestions.enable = true;
  syntaxHighlighting.enable = true;

 # shellAliases = {
 #   ll = "ls -l";
 #   update = "sudo nixos-rebuild switch";
 # };
 # history.size = 10000;
 # history.path = "${config.xdg.dataHome}/zsh/history";
  };

  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;
  services.blueman.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    # media-session.enable = true;
  };

   # USB Automounting
  services.gvfs.enable = true;
  # services.udisks2.enable = true;
  # services.devmon.enable = true;

  # Enable USB Guard
 # services.usbguard = {
 #   enable = true;
 #   dbus.enable = true;
 #   implicitPolicyTarget = "block";
 #   # FIXME: set yours pref USB devices (change {id} to your trusted USB device), use `lsusb` command (from usbutils package) to get list of all connected USB devices including integrated devices like camera, bluetooth, wifi, etc. with their IDs or just disable `usbguard`
 #   rules = ''
 #     allow id {id} # device 1
 #     allow id {id} # device 2
 #   '';
 # };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
