function sublp -a dir -d 'Open DIRECTORY in Sublime Text as project'
    set SUBLIME_PROJECT '{
  "folders": [
    {
      "path": ".",
    }
  ],
}'

    set -l dir (path resolve (default $dir .))
    set -l name (path basename $dir)
    set -l project (default (path resolve $dir/*.sublime-project)[1] "$dir/$name.sublime-project")

    test -e $dir || return 1

    test -f $project || echo $SUBLIME_PROJECT >$project

    subl --project $project
    and cd $dir
end

complete -c sublp -a '(path dirname ~/Projects/**.sublime-project)'
