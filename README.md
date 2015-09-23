== Lavaboom Docker info

=== Assumptions

1. Hosts have connected to LAN via a `docker0` interface.
2. Private keys (like TLS) are stored under `/opt`
3. RethinkDB is running and bound to the `docker0` IP (localhost optional).
	1. Follow [these steps](http://www.rethinkdb.com/docs/start-on-startup/) to make RethinkDB restart itself.

