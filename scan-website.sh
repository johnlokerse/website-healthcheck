website_url=$1
scan_text=$2
status_code=$(curl --silent --location --head --output /dev/null --write-out "%{http_code}" "${website_url}")

if [ "${status_code}" != "200" ]; then
    echo "Website is unreachable (${status_code})" >&2
    exit 1
fi

if ! $(curl --silent --location "{$website_url}" | grep --quiet --ignore-case "${scan_text}"); then
    echo "Text was not found on website" >&2
    exit 1
fi

exit 0
