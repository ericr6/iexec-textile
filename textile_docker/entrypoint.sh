#!/bin/sh
mkdir rendering2
touch rendering2/testfile
echo "" | /usr/local/bin/textile buckets push rendering2/* rendering2
