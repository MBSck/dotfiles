return {
  "AstroNvim/astrocommunity",

  -- Colorscheme
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },

  -- Codeium
  { import = "astrocommunity.completion.codeium-vim" },
  
  -- Motion
  { import = "astrocommunity.motion.vim-matchup" },

  -- Note taking
  { import = "astrocommunity.note-taking.neorg" },

  -- Markdown and latex
  { import = "astrocommunity.markdown-and-latex.vimtex" },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },

  -- Code runners
  { import = "astrocommunity.code-runner.overseer-nvim" },
}
