M = {}

function M.colors()
    local colorscheme = require("tokyonight.colors").setup()
    local defaults = {
        none = "NONE",
        fg = "#abb2bf",
        fg_1 = "#1F3442",
        fg_float = "#bbc2cf",
        bg = "#1e222a",
        bg_1 = "#303742",
        bg_2 = "#16161E",
        bg_float = "#202328",
        black = "#181a1f",
        black_1 = "#1f1f25",
        green = "#98c379",
        green_1 = "#89b06d",
        green_2 = "#95be76",
        white = "#dedede",
        white_1 = "#afb2bb",
        white_2 = "#c9c9c9",
        blue = "#61afef",
        blue_1 = "#40d9ff",
        blue_2 = "#1b1f27",
        blue_3 = "#8094B4",
        blue_4 = "#90c7f3",
        orange = "#d19a66",
        orange_1 = "#ff9640",
        orange_2 = "#ff8800",
        yellow = "#e5c07b",
        yellow_1 = "#ebae34",
        yellow_2 = "#d1b071",
        red = "#e06c75",
        red_1 = "#ec5f67",
        red_2 = "#ffbba6",
        red_3 = "#cc626a",
        red_4 = "#d47d85",
        red_5 = "#e9989e",
        grey = "#5c6370",
        grey_1 = "#4b5263",
        grey_2 = "#777d86",
        grey_3 = "#282c34",
        grey_4 = "#2c323c",
        grey_5 = "#3e4452",
        grey_6 = "#3b4048",
        grey_7 = "#5c5c5c",
        grey_8 = "#252931",
        grey_9 = "#787e87",
        grey_10 = "#D3D3D3",
        gold = "#ffcc00",
        cyan = "#56b6c2",
        cyan_1 = "#88cbd4",
        purple = "#c678dd",
        purple_1 = "#a9a1e1",
        purple_2 = "#c2bdea",

        -- Icon colors
        c = "#519aba",
        css = "#61afef",
        deb = "#a1b7ee",
        docker = "#384d54",
        html = "#de8c92",
        jpeg = "#c882e7",
        jpg = "#c882e7",
        js = "#ebcb8b",
        jsx = "#519ab8",
        kt = "#7bc99c",
        lock = "#c4c720",
        lua = "#51a0cf",
        mp3 = "#d39ede",
        mp4 = "#9ea3de",
        out = "#abb2bf",
        png = "#c882e7",
        py = "#a3b8ef",
        rb = "#ff75a0",
        robots = "#abb2bf",
        rpm = "#fca2aa",
        rs = "#dea584",
        toml = "#39bf39",
        ts = "#519aba",
        ttf = "#abb2bf",
        vue = "#7bc99c",
        woff = "#abb2bf",
        woff2 = "#abb2bf",
        zip = "#f9d71c",
        md = "#519aba",
        pkg = "#d39ede",

        -- Plugin specific colors
        error = "",
        warning = "",
        hint = "",
        info = "",
        git_add = "#266d6a",
        git_change = "#536c9e",
        git_delete = "#b2555b",
    }
    local functions = require("config.utils").functions
    return functions.combineLists(colorscheme, defaults)
end

M.headers = {
    neovim_logo = {
        "⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣄⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⣀⣶⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣷⣄⠀⠀⠀⠀⠀",
        "⠀⠀⠀⣀⣶⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣷⣄⠀⠀⠀",
        "⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣷⡀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣷⣄⠀",
        "⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠄⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣷",
        "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡂⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿",
        "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿",
        "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿",
        "⣿⣿⣿⣿⣿⣿⣿⣿⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿",
        "⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿",
        "⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⣿⣿⣿⣿⣿⣿⣿⣿",
        "⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿",
        "⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
        "⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
        "⢿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿",
        "⠀⠙⢿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀",
        "⠀⠀⠀⠙⢿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠙⢿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⡿⠋⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠙⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠋       ",
    },

    hydra_header = {
        "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
        "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
        "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
        "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
        "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
        "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
        "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
        " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
        " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
        "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
        "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
    },
}


-- Additional icons
--             
--           ﳠ  
--            
--      ⋗ Ω p 

M.icons = {
    -- TODO: Reorder icons in shapes and similar
    general = {
        devil = "",
        settings = "",
        bar = "█",
        thin_bar = "▊"
    },

    -- FileModified = "",

    lsp = {
        error = "",
        warn = "",
        hint = "⚑",
        info = "",
        prefix = "●",
    },

    mason = {
        install = "✓",
        pending = "➜",
        uninstall = "✗",
    },

    git = {
        add = '',
        change = '',
        delete = '',
        top_delete = '‾',
        change_delete = '▎',
        untrack = '┆',
        branch =  "",
    },

    lualine = {
        component = {
            triangle = { left = '', right = '' },
            halfcircle = { left = '', right = '' },
            none = { left = "", right = ""},
        },
        section = {
            topslope = { left = '', right = '' },
            triangle = { left = '', right = '' },
            botslope = { left = ' ', right = ' ' },
            halfcircle = { left = '', right = '' },
            trapezoid = { left = '', right = '' },
            pixelslope = { left = '', right = '' },
            pixelbar = { left = '', right = '' },
            legoside = { left = '', right = '' },
            legorotated = { left = '', right = '' },
            none = { left = "", right = ""},
        },
        time = " ",
    },

    bufferline = {
        indicator = '▎',
    },

    dashboard = {
        update = '',
        files = '',
        apps = '',
        dotfiles = '',
        exit = '',
        clock = '',
        date = '',
    },

    comments = {
        fix = '',
        todo = '',
        hack = '',
        warn = '',
        perf = '',
        note = '',
        test = '⏲',
    },

    neotree ={
        indent_marker = "│",
        last_indent_maker = "└",
        expander_collapse = "",
        expander_expanded = "",
        folder_closed = "",
        folder_open = "",
        folder_empty = "ﰊ",
        default = "*",
        git = {
            add = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
            change = "", -- or "", but this is redundant info if you use git_status_colors on the name
            delete = "✖",-- this can only be used in the git_status source
            rename = "",-- this can only be used in the git_status source
            -- Status type
            untrack = "",
            ignore = "",
            stage = "",
            unstage = "",
            conflict = "",
        }
    },

    telescope = {
        entry_prefix = "",
        prompt_prefix = "",
        selection_caret = "",
    },

    indent_blankline = {
        eol = "↴",
    },

    lsp_signature = {
        hint_prefix = "",
    },

    scrollbar = {
        body = "█",
    },

    dap = {
        breakpoint = "🔴",
        stop = "🟢",
    },

    colorful_winsep = { "━", "┃", "┏", "┓", "┗", "┛" },
}

M.text = {
    cmp = {
        source_mapping = {
            nvim_lsp = '[LSP]',
            luasnip = '[Snippet]',
            treesitter = '[TS]',
            cmp_tabnine = '[TN]',
            nvim_lua = '[Vim]',
            path = '[Path]',
            buffer = '[Buffer]',
            crates = '[Crates]',
            copilot = '[Copilot]',
            codeium = '[Codeium]',
        },

        none_source_mapping = {
            nvim_lsp = '',
            luasnip = '',
            treesitter = '',
            cmp_tabnine = '',
            nvim_lua = '',
            path = '',
            buffer = '',
            crates = '',
            copilot = '',
            codeium = '',
        }
    },

    quotes = {
        star_trek = {
            {
                "A man either lives life as it happens to him, meets it head-on and licks it, or he turns his back on it and starts to wither away.",
                "",
                "- Dr. Boyce"
            },
            {
                "Logic is the beginning of wisdom, not the end.",
                "",
                "- Spock"
            },
            {
                "You may find that having is not so pleasing a thing as wanting. This is not logical, but it is often true.",
                "",
                "- Spock"
            },
            {
                "Live now; make now always the most precious time. Now will never come again.",
                "",
                "- Jean-Luc Picard"
            },
            {
                "Sometimes a feeling is all we humans have to go on.",
                "",
                "- Captain Kirk"
            },
            {
                "With the first link, the chain is forged. The first speech censored, the first thought forbidden, the first freedom denied, chains us all irrevocably.",
                "",
                "- Jean-Luc Picard"
            },
            {
                "The prejudices people feel about each other disappear when they get to know each other.",
                "",
                "- Captain Kirk"
            },
            {
                "If we’re going to be damned, let’s be damned for what we really are.",
                "",
                "- Jean-Luc Picard"
            },
            {
                "Insufficient facts always invite danger.",
                "",
                "- Spock"
            },
            {
                "Perhaps man wasn’t meant for paradise. Maybe he was meant to claw, to scratch all the way.",
                "",
                "- Captain Kirk"
            },
            {
                "In critical moments, men sometimes see exactly what they wish to see.",
                "",
                "- Spock"
            },
            {
                "Compassion: that’s the one thing no machine ever had. Maybe it’s the one thing that keeps men ahead of them.",
                "",
                "- Dr. McCoy"
            },
            {
                "Change is the essential process of all existence.",
                "",
                "- Spock"
            },
            {
                "Without followers, evil cannot spread.",
                "",
                "- Spock"
            },
            {
                "Our species can only survive if we have obstacles to overcome. You remove those obstacles. Without them to strengthen us, we will weaken and die.",
                "",
                "- Captain Kirk"
            },
            {
                "Curious, how often you humans manage to obtain that which you do not want.",
                "",
                "- Spock"
            },
            {
                "One man cannot summon the future. But one man can change the present!",
                "",
                "- Spock"
            },
            {
                "To all mankind — may we never find space so vast, planets so cold, heart and mind so empty that we cannot fill them with love and warmth.",
                "",
                "- Garth"
            },
            {
                "You know the greatest danger facing us is ourselves, and irrational fear of the unknown. There is no such thing as the unknown. Only things temporarily hidden, temporarily not understood.",
                "",
                "- Captain Kirk"
            },
        },

        programming = {
            {
                "Debugging is twice as hard as writing the code in the first place. Therefore, if you write the code as cleverly as possible, you are, by definition, not smart enough to debug it.",
                "",
                "- Brian Kernighan",
            },
            {
                "If you don't fail at least 90% of the time, you're not aiming high enough.",
                "",
                "- Alan Kay",
            },
            {
                "Always code as if the person who ends up maintaining your code is a violent psychopath who knows where you live.",
                "",
                "- John Woods",
            },
            {
                "Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away.",
            },
            {
                "If you don't make mistakes, you're not working on hard enough problems.",
                "",
                "- Frank Wilczek",
            },
            {
                "Use tracer bullets to find the target.",
                "",
                "Tracer bullets let you home in on your target by trying things and seeing how close they land.",
            },
            {
                "Always design for concurrency.",
                "",
                "Allow for concurrency, and you'll design cleaner interfaces with fewer assumptions.",
            },
            {
                "Test your software, or your users will.",
                "",
                "Test ruthlessly. Don't make your users find bugs for you.",
            },
            {
                "Don't live with broken windows.",
                "",
                "Fix bad designs, wrong decisions, and poor code when you see them.",
            },
            {
                "Keep knowledge in plain text.",
                "",
                "Plain text won't become obsolete. It helps leverage your work and simplifies debugging and testing.",
            },
            {
                "Use a single editor well.",
                "",
                "The editor should be an extension of your hand; make sure your editor is configurable, extensible, and programmable.",
            },
            {
                "Crash early.",
                "",
                "A dead program normally does a lot less damage than a crippled one.",
            },
            {
                "Design to test.",
                "",
                "Start thinking about testing before you write a line of code.",
            },
            {
                "Work with a user to think like a user.",
                "",
                "It's the best way to gain insight into how the system will really be used.",
            },
            {
                "Test early. Test often. Test automatically.",
                "",
                "Tests that run with every build are much more effective than test plans that sit on a shelf.",
            },
            {
                "Use saboteurs to test your testing.",
                "",
                "Introduce bugs on purpose in a separate copy of the source to verify that testing will catch them.",
            },
            {
                "There's an old story about the person who wished his computer were as easy to use as his telephone. That wish has come true, since I no longer know how to use my telephone.",
                "",
                "- Bjarne Stroustrup",
            },
            {
                'There are only two industries that refer to their customers as "users".',
                "",
                "- Edward Tufte",
            },
            {
                "Easy things should be easy and hard things should be possible.",
                "",
                "- Larry Wall",
            },
            { "They did not know it was impossible, so they did it!", "", "- Mark Twain" },
            {
                "If debugging is the process of removing bugs, then programming must be the process of putting them in.",
                "",
                "- Edsger W. Dijkstra",
            },
            {
                "The average user doesn't give a damn what happens, as long as (1) it works and (2) it's fast.",
                "",
                "- Daniel J. Bernstein",
            },
        }
    }
}

return M

