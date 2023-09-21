function serve -a folder
    # erl -s httpd serve (_default $folder .)
    python -m http.server -d (_default $folder .)
end
