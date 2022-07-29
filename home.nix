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

    # Dev dependecies

    ## Cloud tools
    docker
    docker-compose

    # dev
    flex
    python3
    valgrind
    tig
    gdb
    gcc
    gcc.man
    gnumake

    # nix
    nix-zsh-completions
    # git 
    gnupg

  ];

  services.dunst = {
    enable = true;
  };

  imports = [
    ./programs
  ];
}
