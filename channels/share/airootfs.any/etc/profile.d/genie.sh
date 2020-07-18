if [ "`ps -eo pid,lstart,cmd | grep systemd | grep -v -e grep -e systemd- | sort -n -k2 | awk 'NR==1 { print $1 }'`" != "1" ]; then
    genie -c echo ""
fi
