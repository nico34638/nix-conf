{ config, lib, pkgs, ... }:

let
  config = {
    core = {
      editor = "vim";
      pager = "less --tabs=4 -RFX";
    };
    init.defaultBranch = "master";
    pull.rebase = true;
  };
in {
  programs.git = {
    enable = true;
    userName = "Nicolas Fidel";
    userEmail = "nicolas.fidel@epita.fr";
    extraConfig = config;

  };
}
