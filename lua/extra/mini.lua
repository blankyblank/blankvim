require('mini.comment').setup({ options = { ignore_blank_line = true } })
require('mini.files').setup({ options = { use_as_default_explorer = false } })

-- to use mini.completion ( needs more work still )
--
-- local gen_loader = require('mini.snippets').gen_loader
-- require('mini.snippets').setup({
--   snippets = {
--     gen_loader.from_lang(), -- This includes those defined by friendly-snippets.
--   },
--   mappings = {
--     jump_next = '<Tab>',
--     jump_prev = '<S-Tab>',
--   },
-- })
-- require('mini.completion').setup()
