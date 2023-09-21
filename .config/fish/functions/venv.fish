function venv
    if test ! -e venv
        python -m venv venv
    end

    source venv/bin/activate.fish
end
