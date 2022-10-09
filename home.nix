{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "nicolas";
  home.homeDirectory = "/home/nicolas";

  nixpkgs.config.allowUnfree = true;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  home.packages = with pkgs; [ 
    htop
    tree
    # communication tools
    slack
    discord
    teams

    # Gnome other tools
    gnome.gnome-terminal
    gnome.gnome-screenshot

    man-pages
    man-db

    # Markdown visualizer
    mdp

    # Dev dependecies

    ## Cloud tools
    docker
    docker-compose

    # IDE
    neovim
    alacritty
    # dev
    bear
    binutils
    gcc
    gcc.man
    ccls
    clang-tools
    flex
    valgrind
    tig
    gdb
    gnumake
    nodejs

    # nix
    nix-zsh-completions
    nixpkgs-fmt
    # git 
    gnupg


    # python
    python3
    python3.pkgs.pip

    # Fonts/Theme
    font-manager
    iosevka
    (nerdfonts.override { fonts = [ "Hack" ]; })
    noto-fonts-emoji
    papirus-icon-theme
  ];

  services.dunst = {
    enable = true;
  };
  imports = [
    ./programs
  ];
}
