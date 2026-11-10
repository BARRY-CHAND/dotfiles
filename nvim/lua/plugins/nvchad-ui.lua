return {
    {
        "nvchad/ui",
        lazy = false,
        config = function()
            require('nvchad')
        end,
    },

    {
        'nvchad/base46',
        lazy = false,
        build = function()
            require('base64').load_all_highlights()
        end,
    },

    'nvim-tree/nvim-web-devicons',
    'nvchad/volt', --helper lib for new nvchad ui 
}
