#!/usr/bin/env bash


# bash script to download the subset of the reddit comments dataset corresponding to a specified
# timeframe and import it into the HDFS running on our cluster
#
# written by Filip Bodlund Trostén, 2023
#
# usage: ./importRedditComments.sh START_YEAR START_MONTH END_YEAR END_MONTH
# example: ./importRedditComments.sh 2005 01 2011 10
# the example above will import all reddit comments from 2005-01 to 2011-10 (inclusive)
#
# note that the dataset starts at 2005-12 and (currently) ends at 2023-02


# as the dataset is large, fragmented and compressed, the script will perform the following:
# - create an empty file named 'reddit-comments' in HDFS (overwriting if necessary)
# - for each month in the specified timeframe:
#       - download and extract the data from that month
#       - append that data into the 'reddit-comments' file in the HDFS
#       - remove the local files
#
# once done, all reddit comments from the specified timeframe will be stored in the single file 'reddit-comments' in the HDFS

START_YEAR=$1
START_MONTH=$2
END_YEAR=$3
END_MONTH=$4

year=$START_YEAR
month=$START_MONTH

# create a single empty destination file in HDFS, removing the old file if it exists
if hdfs dfs -test -e reddit-comments
then
        hdfs dfs -rm reddit-comments
fi
hdfs dfs -touchz reddit-comments

# loop over all months in the specified timeframe to download, extract, and append the data to the HDFS file
until [[ $year == $END_YEAR && $month == $(($END_MONTH+1)) ]] || [[ $year == $(($END_YEAR+1)) ]]
do
        if [ $month -lt 10 ]
        then
                pad="0"
        else
                pad=""
        fi

        filename="RC_"$((year))"-"$pad$((month))

        wget http://files.pushshift.io/reddit/comments/$filename.zst
        zstd -d $filename.zst --memory=2048MB
        hdfs dfs -appendToFile $filename reddit-comments
        rm $filename
        rm $filename.zst


        if [ $month -lt 12 ]
        then
                ((month++))
        else
                ((year++))
                month=1
        fi
done
