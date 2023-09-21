set SUBLIME_PROJECT '{
  "folders": [
    {
      "path": "."
    }
  ],
}'

function sublp -a dir -d 'Open DIRECTORY in Sublime Text as project'
    set -l dir (path resolve (_default $dir .))
    set -l name (path basename $dir)
    set -l project (_default (path resolve $dir/*.sublime-project)[1] "$dir/$name.sublime-project")

    test -f "$project" || echo $SUBLIME_PROJECT >"$project"

    test "$PWD" = "$dir" || pushd "$dir"

    subl --project "$project"
end
