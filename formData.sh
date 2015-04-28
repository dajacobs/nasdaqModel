#!/bin/bash
echo 'Pulling Nasdaq ticker list...'
wget 'https://www.dropbox.com/s/gwubyt5iqwqaldx/nasdaqlisted.txt?dl=0' -O daqData
echo 'Nasdaq ticker list pulled.'
function formatData {
    find . -type f -name 'daqData' |
    xargs awk '{print substr($0,0,6);}' |
    cut -f1 -d'|' |
    head -n -5 |
    tail -n +2 > daqData.txt
    find . -type f -name 'daqData.txt' |
    xargs cat > daqData
    rm daqData.txt
}
echo 'Formatting Nasdaq ticker list...'
formatData
echo 'Nasdaq ticker list formated.'
