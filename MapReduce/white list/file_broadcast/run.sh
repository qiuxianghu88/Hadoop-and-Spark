
HADOOP_CMD="/usr/local/src/hadoop-2.6.5/bin/hadoop"
STREAM_JAR_PATH="/usr/local/src/hadoop-2.6.5/share/hadoop/tools/lib/hadoop-streaming-2.6.5.jar"

INPUT_FILE_PATH_1="/The_Man_of_Property.txt"
OUTPUT_PATH="/output_file_broadcast"

$HADOOP_CMD fs -rmr -skipTrash $OUTPUT_PATH

# Step 1.
$HADOOP_CMD jar $STREAM_JAR_PATH \
    -input $INPUT_FILE_PATH_1 \
    -output $OUTPUT_PATH \
    -mapper "python map.py mapper_func white_list" \
    -reducer "python reduce.py reduer_func" \
    -jobconf "mapred.reduce.tasks=3" \
    -file ./map.py \
    -file ./reduce.py \
    -file ./white_list


#$HADOOP_CMD jar $STREAM_JAR_PATH -input $INPUT_FILE_PATH_1 -output $OUTPUT_PATH -mapper "python map.py mapper_func white_list" -reducer "python red.py reduer_func" -jobconf "mapred.reduce.tasks=3" -file ./map.py -file ./red.py -file ./white_list
