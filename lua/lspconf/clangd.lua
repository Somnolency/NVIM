return{
    --capabilities = {"default capabilities", "with offsetEncoding utf-8"},
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    single_file_support = true, 
    root_dir = function()
      return vim.fn.getcwd()
    end
    
}