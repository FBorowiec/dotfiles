vim.g.deepl_api_auth_key = os.getenv 'DEEPL_API_KEY'

require("translate").setup({
    default = {
        command = "google",
        output = "insert"
    },
    preset = {
        output = {
            insert = {
                base = "bottom",
                off = 0,
            }
        }
    }
})
