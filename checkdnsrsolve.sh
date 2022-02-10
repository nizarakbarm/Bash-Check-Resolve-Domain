#!/bin/bash

for resolver in $(cat ip_dns_resolver_good_reliability); do
   for i in $(cat listdomain); do
	hostcheck=$(host -t a $i $resolver)
	geoiplocation=$(geoiplookup $resolver)
	echo $(date)" geoiplocation: "$geoiplocation" resolver: "$resolver" "$hostcheck &>> /root/log_check_dns_resolve_public_dns_$i
  done
done
