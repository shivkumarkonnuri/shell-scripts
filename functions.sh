#!/bin/bash
greet(){
	echo "Hello, $1!"
}

add(){
	echo $(($1+$2))
}

greet "Shiv"
add 3 5
