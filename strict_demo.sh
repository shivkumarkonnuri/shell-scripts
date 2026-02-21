#!/bin/bash
set -euo pipefail

test_undefined_variable(){
	echo "--------------TEST - Undefined Variable--------------------"
	NAME="SHIV"
	echo "Hello $NMAE"
}

test_command_failure(){
	echo "--------------TEST - Failing Command-----------------------"
	cat file.txt
}

test_pipeline_failure(){
	echo "--------------TEST - Failing Pipeline----------------------"
	ls -l file.txt | sort
}

test_undefined_variable  #undefined variables
#test_command_failure #Failing comments
#test_pipeline_failure #Failing pipeline
