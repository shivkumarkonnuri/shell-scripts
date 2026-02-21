#!/bin/bash
value=10

with_local_func()
{
	echo "============================"
	echo "     With Local Keyword     "
	echo "============================"
	local value=20
}

without_local_func()
{
	echo "==============================="
	echo "     Without Local Keyword     "
	echo "==============================="
	
	value=30
}

echo "Initial value: $value"
without_local_func
echo "Modified global value: $value"
value=10
echo "Resetting the value to: $value"
with_local_func
echo "Not modified global value: $value"
