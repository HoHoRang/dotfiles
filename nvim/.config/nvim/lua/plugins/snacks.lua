return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      image = {
        enabled = true,
      },
      explorer = {
        enabled = true,
      },
      picker = {
        enabled = true,
        sources = {
          explorer = {
            hidden = true, -- explorer 사이드바에서 .파일 표시
          },
          files = {
            hidden = true, -- 파일 검색(<leader>ff)에서 .파일 포함
          },
          grep = {
            hidden = true, -- grep 검색에서 .파일 포함
          },
        },
      },
    },
  },
}
