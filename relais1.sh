#!/bin/bash

CUSTOMERS_F="./customer_profiles.csv"
VIEWING_F="./viewing_data.csv"

while IFS= read -r line; do
    IFS="," read ID NAME EMAIL AGE CITY SUB <<< $line

    # champ vide
    if [ -z "${ID}" ] || [ -z "$NAME" ] || [ -z "$EMAIL" ] || [ -z "$AGE" ] || [ -z "$CITY" ] || [ -z "$SUB" ]; then
        continue
    fi

    # age valide
    if ! [[ ${AGE} =~ -?[0-9]+ ]] || [ "$AGE" -lt 1 ]; then
        continue
    fi

    # email valide AINT HAPPENIN!!
    # (echo -n "${EMAIL}" | grep -Eq '\S+@\S+\.\S+') && echo -n "" || echo "inv"
    # if [[ "${EMAIL}" =~ \S* ]]; then
    # if  [[ "${EMAIL}" =~ \S ]]; then
    # if [[ "${EMAIL}" =~ \\S+@\\S+\\.\\S+ ]]; then
        # echo $EMAIL
    # fi
    
    # 2e part => thing
    # while IFS='' read -r v_line; do
    #     IFS=',' read VID _ _ _ DUR; <<< $v_line
    #
    #     TOTAL=0
    #     if [[ ${ID} == ${VID} ]]; then
    #         echo $DUR
    #         TOTAL=$((TOTAL+DUR))
    #         # let $TOTAL += $DUR
    #     fi
    #     # echo $TOTAL
    # done < $VIEWING_F

    echo $line
done < $CUSTOMERS_F

# cat $CUSTOMERS_F | sed -n 1'p' | while read word; do
#     echo $word
# done

# echo $CUSTOMERS
