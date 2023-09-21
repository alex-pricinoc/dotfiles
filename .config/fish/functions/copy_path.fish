function copy_path -a file
    path resolve -Z $file | fish_clipboard_copy
end
