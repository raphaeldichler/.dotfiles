-- Create an autocommand that triggers when opening a new .java file
vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.java",
    callback = function()
        local dir = vim.fn.expand('%:p:h')
        local package_name = dir:gsub("/", "."):gsub("^.*src%.main%.java%.", "")

        vim.api.nvim_buf_set_lines(0, 0, -1, false, {
            "package " .. package_name .. ";",
            "",
            "/**",
            " *",
            " * @author Raphael Dichler",
            " */",
            "public class " .. vim.fn.expand("%:t:r") .. " {",
            "",
            "}"
        })
    end,
})

require("private")
