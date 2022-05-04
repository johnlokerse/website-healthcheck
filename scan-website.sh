website_url=$1
scan_text=$2
max_attempts=$3
retry_delay=$4

counter=1

while [ $counter -le $max_attempts ]
do
    status_code=$(curl --silent --location --head --output /dev/null --write-out "%{http_code}" "${website_url}")

    if [ "${status_code}" = "200" ]; then
        if curl --silent --location "{$website_url}" | grep --quiet --ignore-case "${scan_text}"; then
            echo "Successful healthcheck" >&2
            exit 0
        fi
    fi

    if [ $counter -eq $max_attempts ]; then
        echo "Unsuccessful healthcheck" >&2
        exit 1
    fi

    ((counter=counter+1))

    sleep $retry_delay

done