insecure=$1
website_url=$2
scan_text=$3

curl_options="--silent --location --head --output /dev/null --write-out %{http_code}"
if [ $insecure == "true" ]; then
    curl_options="--insecure ${curl_options}"
fi

status_code=$(curl ${curl_options} "${website_url}")

if [ "${status_code}" != "200" ]; then
    echo "Website is unreachable (${status_code})" >&2
    exit 1
fi

curl_options="--silent --location"
if [ $insecure == "true" ]; then
    curl_options="--insecure ${curl_options}"
fi

if ! curl ${curl_options} "{$website_url}" | grep --quiet --ignore-case "${scan_text}"; then
    echo "Text was not found on website" >&2
    exit 1
fi

exit 0
