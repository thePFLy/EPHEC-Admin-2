$ORIGIN l2-4.ephec-ti.be.
$TTL 3600
@       IN      SOA     dns.l2-4.ephec-ti.be.     admin.l2-4.ephec-ti.be. (
                        2023050601      ; serial number
                        3600            ; refresh period
                        1800            ; retry period
                        604800          ; expire time
                        86400           ; TTL min
                        )

@   IN  NS      dns.l2-4.ephec-ti.be.
@   IN  MX  10  mail.m2-7.ephec-ti.be.

mail    IN      A   192.168.30.2
dns     IN      A   192.168.30.3
web     IN      A   192.168.30.4
