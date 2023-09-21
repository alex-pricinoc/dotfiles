function clone -a repo
    git clone --depth=1 $repo
    cd (basename $repo | sed 's/.git$//')
end
