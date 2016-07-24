HOSTNAME="${COLLECTD_HOSTNAME:-localhost}"
INTERVAL="${COLLECTD_INTERVAL:-60}"

while sleep $INTERVAL ; do
	for server in 8.8.8.8 195.154.236.184 ; do
		data=$(dig +stat toto.fr @$server | awk '/Query\s+time/ {print$4}')
  		echo "PUTVAL \"$HOSTNAME/exec-dnscheck/gauge-$server\" interval=$INTERVAL N:$data"
	done
done