function update_chromium
    set -l OWNER ungoogled-software
    set -l REPO ungoogled-chromium-portablelinux
    set -l CHROMIUM_PATH ~/Applications/ungoogled-chromium

    if test "$(pgrep chrome)"
        echo 'Chromium is currently running'
        return
    end

    set -l tmp_dir (mktemp -d)

    set -l latest_release (curl -s "https://api.github.com/repos/$OWNER/$REPO/releases" \
     | jq '.[0].assets[] | select (.name | contains("linux.tar.xz"))')

    set -l name (echo $latest_release | jq -r '.name')
    set -l download_url (echo $latest_release | jq -r '.browser_download_url')

    echo "Downloading $name"

    set -l archive_path "/tmp/$name"

    curl -L -o "$archive_path" "$download_url"
    and tar -xf "$archive_path" -C "$tmp_dir" --strip=1
    or return

    trash $CHROMIUM_PATH

    mv $tmp_dir $CHROMIUM_PATH
end
