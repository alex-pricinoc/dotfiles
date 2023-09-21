function extract -a file
    switch $file
        case "*.zip"
            unzip $file
        case "*.tar.gpg"
            gpg -d $file | tar -x
        case "*"
            tar -xf $file
    end
end
