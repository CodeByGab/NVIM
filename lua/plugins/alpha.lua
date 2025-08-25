return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local function choose_logo(name)
      local path = vim.fn.stdpath("config") .. "/lua/logos/"
      local files = vim.fn.glob(path .. "*.lua", false, true)
      local logos = {}

      for _, file in ipairs(files) do
        local ok, logo = pcall(dofile, file)
        if ok then
          local file_name = file:match(".*/(.+)%.lua$")
          logos[file_name] = logo
        end
      end

      if name and logos[name] then
        return logos[name]
      elseif #vim.tbl_keys(logos) > 0 then
        -- escolhe aleatório
        local keys = vim.tbl_keys(logos)
        math.randomseed(os.time() + vim.loop.hrtime() % 1000000)
        return logos[keys[math.random(#keys)]]
      else
        return "No logo found"
      end
    end

    dashboard.section.header.val = vim.split(choose_logo("mini-knight"), "\n")

    dashboard.section.buttons.val = {
      dashboard.button(
        "n",
        "" .. " ファイルを開(ひら)く (File Explorer)",
        "<cmd> Neotree filesystem reveal right<CR>"
      ),
      -- ファイルを開く (Fairu o hiraku) → Abrir arquivo / File Explorer
      dashboard.button(
        "p",
        "" .. " ファイルを探(さが)す (Find File)",
        "<cmd>Telescope find_files hidden=true no_ignore=true<CR>"
      ),
      -- ファイルを探す (Fairu o sagasu) → Procurar arquivo / Find File
      dashboard.button("e", "" .. " 新(あたら)しいファイル (New File)", "<cmd>enew<CR>"),
      -- 新しいファイル (Atarashii fairu) → Novo arquivo / New File
      dashboard.button("l", "󰒲" .. " レイジー (Lazy)", "<cmd>Lazy<CR>"),
      -- レイジー (Reijii) → Lazy (plugin)
      dashboard.button("m", "" .. " メイソン (Mason)", ":Mason<CR>"),
      -- メイソン (Meison) → Mason (plugin)
      dashboard.button("q", "" .. " 終(しゅう)了(りょう) (Quit)", ":qa<cr>"),
      -- 終了 (Shūryō) → Encerrar / Quit
    }

    local function footer()
      local text = "Salutations, sir. May I please enter?"
      local dialougueTag = "— Ǝna"
      local identSize = 30
      local ident = string.rep(" ", identSize)
      return text .. "\n" .. ident .. dialougueTag
    end

    dashboard.section.footer.val = footer()

    return dashboard.opts
  end,

  config = function(_, opts)
    require("alpha").setup(opts)
  end,
}

-- ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠋⠁⠀⠀⠀⠈⢻⣿⣇⠈⠻⣿⣿⣿
-- ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⣿⣿⣿⣿⣶⣦⣄⣀⠀⠀⠀⠀⠀⠀⢻⣿⠀⠀⠈⠻⣿
-- ⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠑⠢⢄⡀⠀⠀⠀⣿⡇⠀⠀⠀⠈
-- ⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠳⣤⡀⠸⡇⠀⠀⢀⣤
-- ⣿⣿⣿⣿⣿⣿⡿⢃⣼⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣦⣇⣤⣶⣿⣿
-- ⣿⣿⣿⣿⣿⠟⣠⡟⢡⡖⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿
-- ⣿⣿⣿⣿⠏⣼⠏⣰⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿
-- ⣿⣿⣿⠋⡼⠃⠘⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⣴⡀⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿
-- ⣿⡿⠃⠚⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣆⠘⡷⠀⢁⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿
-- ⡿⠁⠀⠀⠀⠀⠀⠀⢠⣶⠀⢺⣿⠀⢹⡀⠀⠀⠀⢀⢹⣿⠀⢠⣴⣿⣷⡀⡤⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸
-- ⡇⠀⠀⠀⠀⠀⠀⠀⢸⣿⣇⠈⢿⣇⠀⢣⠀⠀⠀⠸⡆⠁⣰⣿⣿⣿⣿⡷⠀⣁⣤⣶⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈
-- ⣷⠀⠀⠀⠀⠀⠀⠀⠀⣿⡟⠀⠈⠁⢰⣀⣄⠀⠀⢀⣹⢠⣿⣿⠿⢛⣥⣶⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣆⠀⠀⠉⠀⠀⠀⣿⣿⠸⢋⣥⣾⣿⣿⣿⣿⣿⣿⣿⡟⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣦⠐⠀⠀⠀⠀⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⢠⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣦⠀⠀⡴⢠⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⠃⢠⡟⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀
-- ⣿⣿⣿⠀⠀⠀⠀⡀⠀⠈⠛⠛⢛⣛⣛⣃⣼⢡⣿⣿⣿⣿⣿⡟⣸⣿⣿⣿⣿⠏⠀⠉⠀⠀⠀⠀⠃⠀⠀⠀⠀⠀⠀⠀
-- ⣿⣿⣿⡆⠀⠀⠀⠈⠂⠀⣤⣾⣿⣿⣿⣿⣿⣦⠹⣿⣿⣿⡟⣱⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠸⣼⣿⣿⣿⣿⣿⣿⣷⣌⠻⢋⣼⣿⣿⣿⣧⡐⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠
-- ⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⠿⣿⣿⣿⣿⣿⣷⣌⠻⣿⣿⣿⠿⠛⠁⠀⠀⠀⠀⢠⠄⠀⢀⣀⣠⣤⣶⣾⣿⣿
-- ⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠁⠀⠉⠁⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
-- ⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡠⠀⠀⠀⢀⣠⠤⠶⠀⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
-- ⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⠄⣠⣶⡈⢁⣠⣤⣶⡿⠋⣠⣶⣾⣿⣷⣤⡙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿
-- ⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⠟⢁⣶⣟⣽⣿⣦⣙⠟⠋⢀⣾⣿⣿⣿⣿⣿⣿⣿⣄⠻⣿⣿⣿⣿⣿⣿⣿⣿
-- ⣿⣿⣿⠀⠁⠀⠀⠀⠀⠀⢀⣠⣾⠟⠁⠀⠈⠉⠉⠉⠙⠛⠋⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡙⣿⣿⣿⣿⣿⣿⣿
-- ⣿⣿⡟⠀⠚⠓⠀⠀⠀⠀⣿⣿⣿⡇⠀⢠⣶⣶⣶⣶⣦⣤⡄⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠘⣿⣿⣿⣿⣿⣿
--
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣴⣾⣿⣿⣿⣷⡄⠀⠸⣷⣄⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⠀⠀⠀⠀⠉⠙⠻⠿⣿⣿⣿⣿⣿⣿⡄⠀⣿⣿⣷⣄⠀
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣶⣮⣝⡻⢿⣿⣿⣿⠀⢸⣿⣿⣿⣷
-- ⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣌⠛⢿⣇⢸⣿⣿⡿⠛
-- ⠀⠀⠀⠀⠀⠀⢀⡼⠃⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠙⠸⠛⠉⠀⠀
-- ⠀⠀⠀⠀⠀⣠⠟⢠⡞⢩⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀
-- ⠀⠀⠀⠀⣰⠃⣰⠏⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀
-- ⠀⠀⠀⣴⢃⣼⣧⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣿⠋⢿⡏⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀
-- ⠀⢀⣼⣥⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠹⣧⢈⣿⡾⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀
-- ⢀⣾⣿⣿⣿⣿⣿⣿⡟⠉⣿⡅⠀⣿⡆⢿⣿⣿⣿⡿⡆⠀⣿⡟⠋⠀⠈⢿⢛⣿⣿⣿⣿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
-- ⢸⣿⣿⣿⣿⣿⣿⣿⡇⠀⠸⣷⡀⠸⣿⡜⣿⣿⣿⣇⢹⣾⠏⠀⠀⠀⠀⢈⣿⠾⠛⠉⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷
-- ⠈⣿⣿⣿⣿⣿⣿⣿⣿⠀⢠⣿⣷⣾⡏⠿⠻⣿⣿⡿⠆⡟⠀⠀⣀⡤⠚⠉⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
-- ⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠹⣿⣿⣶⣿⣿⣿⠀⠀⣇⡴⠚⠁⠀⠀⠀⠀⠀⠀⠀⢠⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
-- ⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠙⣯⣿⣿⣿⣿⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⡟⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
-- ⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠙⣿⣿⢋⡟⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⣼⡟⢠⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿
-- ⠀⠀⠀⣿⣿⣿⣿⢿⣿⣷⣤⣤⡤⠤⠤⠼⠃⡞⠀⠀⠀⠀⠀⢠⠇⠀⠀⠀⠀⣰⣿⣶⣿⣿⣿⣿⣼⣿⣿⣿⣿⣿⣿⣿
-- ⠀⠀⠀⢹⣿⣿⣿⣷⣽⣿⠛⠁⠀⠀⠀⠀⠀⠙⣆⠀⠀⠀⢠⠎⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
-- ⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣇⠃⠀⠀⠀⠀⠀⠀⠈⠳⣄⡴⠃⠀⠀⠀⠘⢯⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟
-- ⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄⣀⠀⠀⠀⠀⠀⠈⠳⣄⠀⠀⠀⣀⣤⣾⣿⣿⣿⣿⡟⣻⣿⡿⠿⠟⠛⠉⠁⠀⠀
-- ⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣶⣶⣾⣿⣶⣾⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⢟⣿⣿⣿⡿⠟⣛⣉⣿⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⣻⠟⠉⢷⡾⠟⠛⠉⢀⣴⠟⠉⠁⠀⠈⠛⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⣠⡾⠉⠠⠂⠀⠙⠦⣠⣴⡿⠁⠀⠀⠀⠀⠀⠀⠀⠻⣄⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⣿⣾⣿⣿⣿⣿⣿⡿⠟⠁⣠⣾⣿⣷⣶⣶⣶⣦⣤⣴⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢦⠀⠀⠀⠀⠀⠀⠀
--
-- 	[[ ██▓███   ▒█████   ██▀███  ▄▄▄█████▓ ▄▄▄        ██████  ██▒   █▓ ██▓ ███▄ ▄███▓]],
-- 	[[▓██░  ██▒▒██▒  ██▒▓██ ▒ ██▒▓  ██▒ ▓▒▒████▄    ▒██    ▒ ▓██░   █▒▓██▒▓██▒▀█▀ ██▒]],
-- 	[[▓██░ ██▓▒▒██░  ██▒▓██ ░▄█ ▒▒ ▓██░ ▒░▒██  ▀█▄  ░ ▓██▄    ▓██  █▒░▒██▒▓██    ▓██░]],
-- 	[[▒██▄█▓▒ ▒▒██   ██░▒██▀▀█▄  ░ ▓██▓ ░ ░██▄▄▄▄██   ▒   ██▒  ▒██ █░░░██░▒██    ▒██ ]],
-- 	[[▒██▒ ░  ░░ ████▓▒░░██▓ ▒██▒  ▒██▒ ░  ▓█   ▓██▒▒██████▒▒   ▒▀█░  ░██░▒██▒   ░██▒]],
-- 	[[▒▓▒░ ░  ░░ ▒░▒░▒░ ░ ▒▓ ░▒▓░  ▒ ░░    ▒▒   ▓▒█░▒ ▒▓▒ ▒ ░   ░ ▐░  ░▓  ░ ▒░   ░  ░]],
-- 	[[░▒ ░       ░ ▒ ▒░   ░▒ ░ ▒░    ░      ▒   ▒▒ ░░ ░▒  ░ ░   ░ ░░   ▒ ░░  ░      ░]],
-- 	[[░░       ░ ░ ░ ▒    ░░   ░   ░        ░   ▒   ░  ░  ░       ░░   ▒ ░░      ░   ]],
-- 	[[             ░ ░     ░                    ░  ░      ░        ░   ░         ░  ]],
-- 	[[                                                            ░                   ]],
-- dashboard.section.buttons.val = {
-- 	dashboard.button(
-- 		"n",
-- 		"" .. "  開 [ひら] くファイル File Explorer",
-- 		"<cmd> Neotree filesystem reveal right<CR>"
-- 	),
-- 	dashboard.button("p", "" .. "  Find File", "<cmd>Telescope find_files hidden=true no_ignore=true<CR>"),
-- 	dashboard.button("e", "" .. "  New File", "<cmd>enew<CR>"),
-- 	dashboard.button("l", "󰒲" .. "  Lazy", "<cmd>Lazy<CR>"),
-- 	dashboard.button("m", "" .. "  Mason", ":Mason<CR>"),
-- 	dashboard.button("q", "" .. "  Quit", ":qa<cr>"),
-- }
