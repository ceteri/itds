#!/bin/bash -ex
 
## find your "hadoop-streaming.jar" and set this appropriately
STREAM_JAR=$HADOOP_HOME/contrib/streaming/hadoop-streaming-1.0.3.jar
 
## clear the output directory (Hadoop requires this)
rm -rf out
 
## run the Py scripts in Hadoop Streaming 
$HADOOP_HOME/bin/hadoop jar $STREAM_JAR -input data -output out \
  -mapper wc_map.py -reducer wc_red.py
 
## look at the output
cat out/part-00000 | sort -nr -k2 | head
