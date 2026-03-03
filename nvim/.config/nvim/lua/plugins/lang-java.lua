-- ~/.config/nvim/lua/plugins/lang-java.lua
return {
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      settings = {
        java = {
          configuration = {
            runtimes = {
              -- 프로젝트 빌드는 Java 17 사용
              {
                name = "JavaSE-17",
                path = "/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home",
                default = true,
              },
              { name = "JavaSE-21", path = "/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home" },
            },
          },
        },
      },
    },
  },
}
