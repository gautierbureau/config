run_mapreduce() {
	hadoop jar /usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.0.0-mr1-cdh4.1.1.jar -mapper $1 -reducer $2 -file $1 -file $2 -input $3 -output $4
}

see_bash_options() {
	shopt | grep on
}

deploy_rte_functions() {
  ln -s ~/Config/bashrc-functions-rte.bash ~/.bashrc-functions-rte.bash
}

if [ -f ~/.bashrc-functions-rte.bash ]; then
  . ~/.bashrc-functions-rte.bash
fi
