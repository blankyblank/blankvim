return {
  cmd = {
    'clangd',
    '--background-index',
    '--clang-tidy',
    '--enable-config',
    '--header-insertion=iwyu',
    '--header-insertion-decorators',
    '--completion-style=detailed',
    '--function-arg-placeholders=1',
    '--fallback-style=llvm',
    '--log=error',
    '--pretty',
  },
  root_markers = {
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac', -- AutoTools
    'Makefile',
    'meson.build',
    'meson_options.txt',
    '.git',
  },
  filetypes = { 'c', 'h' },
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true,
  },
  capabilities = {
    positionEncodings = { 'utf-8', 'utf-16' },
  },
  textDocument = {
    completion = {
      completionItem = {
        commitCharactersSupport = true,
        deprecatedSupport = true,
        documentationFormat = { 'markdown', 'plaintext' },
        insertReplaceSupport = true,
        insertTextModeSupport = {
          valueSet = { 1 },
        },
        labelDetailsSupport = true,
        preselectSupport = true,
        resolveSupport = {
          properties = { 'documentation', 'detail', 'additionalTextEdits', 'command', 'data' },
        },
        snippetSupport = true,
        tagSupport = {
          valueSet = { 1 },
        },
      },
      completionList = {
        itemDefaults = { 'commitCharacters', 'editRange', 'insertTextFormat', 'insertTextMode', 'data' },
      },
      contextSupport = true,
      editsNearCursor = true,
      insertTextMode = 1,
    },
  },
}
