#!/bin/bash

for key in `ls Kl2-4.ephec-ti.be*.key`
do
echo "\$INCLUDE $key">> l2-4.ephec-ti.be.zone
done
