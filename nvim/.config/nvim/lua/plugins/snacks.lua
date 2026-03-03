return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      image = {
        enabled = true, -- 여기서 true로 설정해야 합니다!
      },
      -- 에디터 성능을 위해 다른 유용한 기능들도 켜줍니다
      explorer = { enabled = true },
      picker = { enabled = true },
    },
  },
}
