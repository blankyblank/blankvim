return {
  cmd = {
    'clangd',
    '--background-index',
    '--clang-tidy',
    '--header-insertion=iwyu',
    '--completion-style=detailed',
    '--function-arg-placeholders',
    '--fallback-style=llvm',
    '--log=error',
  },
  root_markers = {
    "compile_commands.json",
    "compile_flags.txt",
    "configure.ac", -- AutoTools
    "Makefile",
    "meson.build",
    "meson_options.txt",
    ".git",
  },
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true,
  },
  textDocument = {
    completion = {
      completionItem = {
        commitCharactersSupport = false,
        deprecatedSupport = true,
        documentationFormat = { "markdown", "plaintext" },
        insertReplaceSupport = true,
        insertTextModeSupport = {
          valueSet = { 1 }
        },
        labelDetailsSupport = true,
        preselectSupport = true,
        resolveSupport = {
          properties = { "documentation", "detail", "additionalTextEdits", "command", "data" }
        },
        snippetSupport = true,
        tagSupport = {
          valueSet = { 1 }
        }
      },
      completionList = {
        itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
      },
      contextSupport = true,
      editsNearCursor = true,
      insertTextMode = 1
    }
  },
}
