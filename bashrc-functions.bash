run_mapreduce() {
	hadoop jar /usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.0.0-mr1-cdh4.1.1.jar -mapper $1 -reducer $2 -file $1 -file $2 -input $3 -output $4
}

see_bash_options() {
	shopt | grep on
}

create_patch_unstaged() {
	if [ -z "$1" ]; then
		echo "You need a filename."
		exit 1
	fi
	git diff > $1
}

create_patch_staged() {
	if [ -z "$1" ]; then
		echo "You need a filename."
		exit 1
	fi
	git diff --cached > $1
}

create_patch_all() {
	if [ -z "$1" ]; then
		echo "You need a filename."
		exit 1
	fi
	git diff HEAD > $1
}

create_patch_last_commit() {
	git format-patch -1
}

create_patch_n_commit() {
	if [ -z "$1" ]; then
		echo "You need a filename."
		exit 1
	fi
	git format-patch -$1
}

apply_patch() {
	if [ -z "$1" ]; then
		echo "You need a filename."
		exit 1
	fi
	git apply $1
}

if [ -f ~/Config/bashrc-functions-rte.bash ]; then
  . ~/Config/bashrc-functions-rte.bash
fi
