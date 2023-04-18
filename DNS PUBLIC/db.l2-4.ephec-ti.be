$ORIGIN l2-4.ephec-ti.be.
$TTL 604800

@     IN     SOA     dns.l2-4.ephec-ti.be.     admin.l2-4.ephec-ti.be. (

                        5             ; serial

                        900        ; refresh

                        600         ; retry

                        86400       ; expire

                        3600 )      ; negative cachhe TTL

l2-4.ephec-ti.be.  IN      NS       dns.l2-4.ephec-ti.be.

dns          IN       A       192.168.30.2

web          IN       A       192.168.30.3

mail         IN       A       192.168.30.4
