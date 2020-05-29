#!/bin/bash

# Script for check list certificates (via CryptoPro CSP).
# Subject and KeyID of certificates are saving in 'certs.txt'
# Copyright (C) 2020 Korneechev Evgeniy <ek@myconnector.ru>

# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 2 of the License.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see http://www.gnu.org/licenses/.

/opt/cprocsp/bin/*/certmgr --list | grep -E "Subj|after" > certs.txt
echo "Subject and KeyID of certificates saved in 'certs.txt'."
echo -n "Number of certificates: "
grep Subject certs.txt | wc -l
