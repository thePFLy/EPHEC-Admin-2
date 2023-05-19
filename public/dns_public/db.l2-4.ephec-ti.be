$ORIGIN l2-4.ephec-ti.be.
$TTL 3600
@       IN      SOA     ns.l2-4.ephec-ti.be.     admin.l2-4.ephec-ti.be. (
                        2023050601      ; serial number
                        3600            ; refresh period
                        1800            ; retry period
                        604800          ; expire time
                        86400           ; TTL min
                        )

@   IN  NS      ns.l2-4.ephec-ti.be.
@   IN  MX  10  mail.l2-4.ephec-ti.be.

mail    IN      A   79.137.81.65
ns     IN      A   79.137.81.65
web     IN      A   79.137.81.65
