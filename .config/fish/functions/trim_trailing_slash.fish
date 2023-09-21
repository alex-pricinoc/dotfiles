function trim_trailing_slash
    read str
    string replace -r '/$' '' $str
end
