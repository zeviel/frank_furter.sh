#!/bin/bash

api="https://api.frankfurter.app"
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36"

function get_latest_rates() {
    # 1 - base: (string) - the base currency symbol (default: EUR)
    curl --request GET \
        --url "${api}/latest?base=${1:-EUR}" \
        --user-agent "$user_agent" \
        --header "accept: application/json"
}

function convert_currency() {
    # 1 - amount: (float) - the amount to convert
    # 2 - from: (string) - the currency symbol to convert from
    # 3 - to: (string) - the currency symbol to convert to
    # 4 - date: (string) - the date of exchange rates to use (yyyy-mm-dd)
    curl --request GET \
        --url "${api}/convert?amount=${1}&from=${2}&to=${3}&date=${4}" \
        --user-agent "$user_agent" \
        --header "accept: application/json"
}
