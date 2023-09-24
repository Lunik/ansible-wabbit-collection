#!/bin/bash

#################
# CONFIGURATION #
#################

DATABASE_PATH="/etc/pihole/pihole-FTL.db"
SQLITE3_BIN="/usr/bin/sqlite3"

##################
# DEFININE PARAM #
##################

yesterday_date=$(date -d "yesterday" +%s)

query_path=$(mktemp --suffix '.dns_prefetch.sql')
trap "rm -f ${query_path}" EXIT
cat > "${query_path}" <<EOF
SELECT
json_group_array(
  json_object(
    'count', count,
    'domain', domain
  )
)
FROM (
  SELECT
    domain,
    count(timestamp) as count
  FROM queries
  WHERE
    (type=1 or type=2)
    AND (status=2 or status=3)
    AND (reply_type=3 or reply_type=4)
    AND timestamp > ${yesterday_date}
    AND client != '127.0.0.1'
  GROUP BY domain
  ORDER BY count desc
  LIMIT 100
);
EOF

##################
#      MAIN      #
##################

# Get the list of domains
domains=$("${SQLITE3_BIN}" "${DATABASE_PATH}" < "${query_path}")

# Make a DNS query for each domain in the list
for domain in $(echo "${domains}" | jq -r '.[].domain'); do
  echo "Prefetching ${domain}"
  nslookup "${domain}" "127.0.0.1" >/dev/null 2>&1
done
