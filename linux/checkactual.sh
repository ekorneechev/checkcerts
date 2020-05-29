#!/bin/bash

# Script for check relevance of the certificates from 'creds.txt' (via CryptoPro CSP).
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

check_date(){
    # Checking date when certificate will be not valid
    certdate="$1"
    year=${certdate##*/}
    day_month=${certdate%/*}
    month_day=$(echo $day_month | sed 's/\([0-9]*\)\/\([0-9]*\)/\2\/\1/')
    not_valid_after=$(date --date "$month_day/$year" +%s)
    current_date=$(date +%s)
    if [[ "$not_valid_after" > "$current_date" ]]; then
        return 0
    else
        return 1
    fi
}

mkdir tmp
split -l 3 certs.txt tmp/cert_
for f in $(ls tmp); do
    str_date=$(grep after tmp/$f)
    cert_date=${str_date#*:}
    check_date "$cert_date"
    [ $? -eq 0 ] && cat tmp/$f >> actual_certs.txt
done
rm -rf tmp/
