-- DAP Icons
vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#f38ba8', bg = '' })
vim.api.nvim_set_hl(0, 'DapBreakpointCondition', { ctermbg = 0, fg = '#c6a0f6', bg = '' })
vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#74c7ec', bg = '' })
vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#a6e3a1', bg = '#494d64' })

vim.fn.sign_define('DapBreakpoint', { text=" ", texthl='DapBreakpoint', linehl='', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text=' ', texthl='DapBreakpoint', linehl='', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text=' ', texthl='DapBreakpoint', linehl='', numhl= 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text=" ", texthl='DapLogPoint', linehl='', numhl= 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text=" ", texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })
