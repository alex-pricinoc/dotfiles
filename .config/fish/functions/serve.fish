function serve -a folder
    # erl -s httpd serve (default $folder .)
    python -m http.server -d (default $folder .)
end
