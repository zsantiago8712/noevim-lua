local status_ok, navigator = pcall(require, "navigator")
if not status_ok then
    return
end


-- require'navigator'.setup({
--     transparency = 0,
--     lsp = {
--       disable_lsp = { "ccls" }, -- will not run rust_analyzer setup from navigator
--       ['lua-dev'] = { runtime_path=true }  -- any non default lua-dev setups
--     },
--   })


navigator.setup{
    debug = false, -- log output
    width = 0.62, -- valeu of cols
    height = 0.38, -- listview height
    preview_height = 0.38,
    preview_lines = 40, -- total lines in preview screen
    border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
    preview_lines_before = 5, -- lines before the highlight line
    default_mapping = false,
    external = nil, -- true: enable for goneovim multigrid otherwise false
    lsp_signature_help = true,
    signature_help_cfg = nil,


    keymaps={
        { key = 'gt', func = require('navigator.treesitter').buf_ts, desc = 'buf_ts' },
        { key = 'gn', func = require('navigator.rename').rename, desc = 'rename' },
        { key = 'K', func = vim.lsp.buf.hover, desc = 'hover' },
        { key = 'gd', func = require('navigator.definition').definition, desc = 'definition' },
        { key = 'ga', func = vim.lsp.buf.declaration, desc = 'declaration' },
        { key = 'gL', func = require('navigator.diagnostics').show_diagnostics, desc = 'show_diagnostics' },
        { key = 'gb', func = require('navigator.diagnostics').show_buf_diagnostics, desc = 'show_buf_diagnostics' },
        { key = 'gs', func = vim.lsp.signature_help, desc = 'signature_help' },
        --{ mode = 'i', key = '<c-k>', func = vim.lsp.signature_help, desc = 'signature_help' },
        
        --TODO: Areglar transparencia
        { key = 'gr', func = require('navigator.reference').async_ref, desc = 'async_ref' },
        { key = 'gp', func = require('navigator.definition').definition_preview, desc = 'definition_preview' },
        { key = 'gw', func = require('navigator.workspace').list_workspace_folders, desc = 'list_workspace_folders' },
        { key = 'gi', func = vim.lsp.buf.incoming_calls, desc = 'incoming_calls' },
        { key = 'go', func = vim.lsp.buf.outgoing_calls, desc = 'outgoing_calls' },

    }, 
    border = 'single', -- border style, can be one of 'none', 'single', 'double', "shadow"
    lines_show_prompt = 10, -- when the result list items number more than lines_show_prompt,
    -- fuzzy finder prompt will be shown
    combined_attach = 'both', -- both: use both customized attach and navigator default attach, mine: only use my attach defined in vimrc
    transparency = 100,
    --tags = { cmd = 'ctags', tagfile = '.tags' },
    lsp = {
        enable = true, -- if disabled make sure add require('navigator.lspclient.mapping').setup() in you on_attach
        code_action = {
        enable = true,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
        virtual_text_icon = true,
        },
        code_lens_action = {
            enable = true,
            sign = true,
            sign_priority = 40,
            virtual_text = true,
            virtual_text_icon = true,
        },
        diagnostic = {
            underline = true,
            virtual_text = { spacing = 3, source = true }, -- show virtual for diagnostic message
            update_in_insert = false, -- update diagnostic message in insert mode
            severity_sort = { reverse = true },
        },
        format_on_save = true, -- set to false to disasble lsp code format on save (if you are using prettier/efm/formater etc)
        format_options = { async = false }, -- async: disable by default, I saw something unexpected
        disable_nulls_codeaction_sign = true, -- do not show nulls codeactions (as it will alway has a valid action)
        disable_format_cap = {},
        disable_lsp = { "ccls" }, -- will not run rust_analyzer setup from navigator
        disply_diagnostic_qf = false, -- always show quickfix if there are diagnostic errors
        diagnostic_load_files = false, -- lsp diagnostic errors list may contains uri that not opened yet set to true
        -- to load those files
        diagnostic_virtual_text = true, -- show virtual for diagnostic message
        diagnostic_update_in_insert = fasle, -- update diagnostic message in insert mode
        --diagnostic_scrollbar_sign = { '▃', '▆', '█' }, -- set to nil to disable, set to {'╍', 'ﮆ'} to enable diagnostic status in scroll bar area

        ['lua-dev'] = { runtime_path=true },  -- any non default lua-dev setups

    },
    lsp_installer = true, -- set to true if you would like use the lsp installed by williamboman/nvim-lsp-installer


    icons = {
        icons = true, -- set to false to use system default ( if you using a terminal does not have nerd/icon)
        -- Code action
        code_action_icon = '', -- "",
        -- code lens
        code_lens_action_icon = '👓',
        -- Diagnostics
        diagnostic_head = '🐛',
        diagnostic_err = '',
        diagnostic_warn = '',
        diagnostic_info = [[]],
        diagnostic_hint = [[]],
    
        diagnostic_head_severity_1 = '☢︎',
        diagnostic_head_severity_2 = '☣️',
        diagnostic_head_severity_3 = '☠︎',
        diagnostic_head_description = '⚠︎',
        diagnostic_virtual_text = '💬',
        diagnostic_file = '🚑',
        -- Values
        value_changed = '📝',
        value_definition = '〠', -- it is easier to see than 🦕
        side_panel = {
          section_separator = '',
          line_num_left = '',
          line_num_right = '',
          inner_node = '├○',
          outer_node = '╰○',
          bracket_left = '⟪',
          bracket_right = '⟫',
        },


        -- Treesitter
        match_kinds = {
          var = ' ', -- "👹", -- Vampaire
          method = 'ƒ ', --  "🍔", -- mac
          ['function'] = ' ', -- "🤣", -- Fun
          parameter = '  ', -- Pi
          associated = '🤝',
          namespace = '🚀',
          type = ' ',
          field = '🏈',
          module = '📦',
          flag = '🎏',
        },
        treesitter_defult = '🌲',
        doc_symbols = '',
    },
}
