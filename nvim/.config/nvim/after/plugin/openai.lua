require("chatgpt").setup({
    welcome_message = WELCOME_MESSAGE, -- set to "" if you don't like the fancy robot
    loading_text = "loading",
    question_sign = "", -- you can use emoji if you want e.g. 🙂
    answer_sign = "ﮧ", -- 🤖
    max_line_length = 300,
    yank_register = "+",
    chat_layout = {
        relative = "editor",
        position = "50%",
        size = {
            height = "90%",
            width = "90%",
        },
    },
    chat_window = {
        filetype = "chatgpt",
        border = {
            highlight = "FloatBorder",
            style = "rounded",
            text = {
                top = " ChatGPT ",
            },
        },
    },
    chat_input = {
        prompt = "  : ",
        border = {
            highlight = "FloatBorder",
            style = "rounded",
            text = {
                top_align = "center",
                top = " Prompt ",
            },
        },
        win_options = {
            winhighlight = "Normal:Normal",
        },
    },
    openai_params = {
        model = "text-davinci-003",
        frequency_penalty = 0,
        presence_penalty = 0,
        max_tokens = 500,
        temperature = 1,
        top_p = 1,
        n = 1,
    },
    keymaps = {
        close = "<C-c>",
        yank_last = "<C-y>",
        scroll_up = "<C-u>",
        scroll_down = "<C-d>",
    },
})
