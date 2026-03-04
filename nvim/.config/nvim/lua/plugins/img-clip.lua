return {
  "HakonHarnes/img-clip.nvim",
  event = "BufEnter",
  opts = {
    default = {
      dir_path = "attachments",
      file_name = "%Y-%m-%d_%H-%M-%S",
      use_absolute_path = false,
    },
  },
  keys = {
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from clipboard" },
  },
}
