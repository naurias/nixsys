{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.nvf.settings.vim = {
    keymaps = [
      ### snacks keybindings
      {
        key = "<leader><space>";
        mode = "n";
        action = ":lua Snacks.picker.smart()<cr>";
        desc = "Smart find files";
      }

      {
        key = "<leader>,";
        mode = "n";
        action = ":lua Snacks.picker.buffers()<cr>";
        desc = "Buffers";
      }

      {
        key = "<leader>/";
        mode = "n";
        action = ":lua Snacks.picker.grep()<cr>";
        desc = "Grep";
      }

      {
        key = "<leader>:";
        mode = "n";
        action = ":lua Snacks.picker.command_history()<cr>";
        desc = "Command History";
      }

      {
        key = "<leader>e";
        mode = "n";
        action = ":lua Snacks.explorer()<cr>";
        desc = "File Explorer";
      }

      {
        key = "<leader>ff";
        mode = "n";
        action = ":lua Snacks.picker.files()<cr>";
        desc = "Find Files";
      }

      {
        key = "<leader>fr";
        mode = "n";
        action = ":lua Snacks.picker.recent()<cr>";
        desc = "Find Recent Files";
      }

      {
        key = "<leader>sw";
        mode = "n";
        action = ":lua Snacks.picker.grep_word()<cr>";
        desc = "Grep Word";
      }

      {
        key = "<leader>sc";
        mode = "n";
        action = ":lua Snacks.picker.commands()<cr>";
        desc = "Commands";
      }

      {
        key = "<leader>sk";
        mode = "n";
        action = ":lua Snacks.picker.keymaps()<cr>";
        desc = "Search Keymaps";
      }

      {
        key = "<leader>bd";
        mode = "n";
        action = ":lua Snacks.bufdelete()<cr>";
        desc = "Delete Buffer";
      }
    ];
  };
}
