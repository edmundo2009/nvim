return {
  {
    "lervag/vimtex",
    lazy = false   -- we don't want to lazy load VimTeX
  },
  -- Markdown Previewer
  {
    "OXY2DEV/markview.nvim",
    lazy = true,    -- Recommended
    ft = {"markdown", "tex"}, -- If you decide to lazy-load anyway
    config = function ()

      require("markview").setup({
        modes = { "n", "i", "no", "c" },
        hybrid_modes = { "i", "n" },

        -- This is nice to have
        callbacks = {
          on_enable = function (_, win)
            vim.wo[win].conceallevel = 2;
            vim.wo[win].concealcursor = "nc";
          end
        },
        checkboxes = {
          enable = true,

          checked = {
            text = "󰡖", hl = "MarkviewCheckboxChecked"
          },
          unchecked = {
            text = "", hl = "MarkviewCheckboxUnchecked"
          }
        },
        links = {
          enable = true,

          images = {
            icon = " ",
            hl = "MarkviewImageLink",
          }
        },
        highlight_groups = {
          {
            output = function (hl)
              return {
                group_name = "MarkviewHeading1Corner",
                value = { fg = hl.hex(hl.color("bg", {  "MarkviewHeading1" }, nil, nil)) }
              }
            end
          },
          {
            output = function (hl)
              return {
                group_name = "MarkviewHeading2Corner",
                value = { fg = hl.hex(hl.color("bg", {  "MarkviewHeading2" }, nil, nil)) }
              }
            end
          },
          {
            output = function (hl)
              return {
                group_name = "MarkviewHeading3Corner",
                value = { fg = hl.hex(hl.color("bg", {  "MarkviewHeading3" }, nil, nil)) }
              }
            end
          },
          {
            output = function (hl)
              return {
                group_name = "MarkviewHeading4Corner",
                value = { fg = hl.hex(hl.color("bg", {  "MarkviewHeading4" }, nil, nil)) }
              }
            end
          },
          {
            output = function (hl)
              return {
                group_name = "MarkviewHeading5Corner",
                value = { fg = hl.hex(hl.color("bg", {  "MarkviewHeading5" }, nil, nil)) }
              }
            end
          },
          {
            output = function (hl)
              return {
                group_name = "MarkviewHeading6Corner",
                value = { fg = hl.hex(hl.color("bg", {  "MarkviewHeading6" }, nil, nil)) }
              }
            end
          }
        },
        headings = {
          enable = true,
          shift_width = 0,

          heading_1 = {
            style = "label",

            padding_left = " ",
            padding_right = " ",

            corner_left = "",
            corner_left_hl = "MarkviewHeading1Corner",
            corner_right = "",
            corner_right_hl = "MarkviewHeading1Corner",

            hl = "MarkviewHeading1"
          },
          heading_2 = {
            style = "label",

            padding_left = " ",
            padding_right = " ",

            corner_left = "",
            corner_left_hl = "MarkviewHeading2Corner",
            corner_right = "",
            corner_right_hl = "MarkviewHeading2Corner",

            hl = "MarkviewHeading2"
          },
          heading_3 = {
            style = "label",

            padding_left = " ",
            padding_right = " ",

            corner_left = "",
            corner_left_hl = "MarkviewHeading3Corner",
            corner_right = "",
            corner_right_hl = "MarkviewHeading3Corner",

            hl = "MarkviewHeading3"
          },
          heading_4 = {
            style = "label",

            padding_left = " ",
            padding_right = " ",

            corner_left = "",
            corner_left_hl = "MarkviewHeading4Corner",
            corner_right = "",
            corner_right_hl = "MarkviewHeading4Corner",

            hl = "MarkviewHeading4"
          },
          heading_5 = {
            style = "label",

            padding_left = " ",
            padding_right = " ",

            corner_left = "",
            corner_left_hl = "MarkviewHeading5Corner",
            corner_right = "",
            corner_right_hl = "MarkviewHeading5Corner",

            hl = "MarkviewHeading5"
          },
          heading_6 = {
            style = "label",

            padding_left = " ",
            padding_right = " ",

            corner_left = "",
            corner_left_hl = "MarkviewHeading6Corner",
            corner_right = "",
            corner_right_hl = "MarkviewHeading6Corner",

            hl = "MarkviewHeading6"
          },
        }
      })
    end
  },
  -- Preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  }
}
