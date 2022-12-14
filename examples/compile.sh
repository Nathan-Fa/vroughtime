#!/bin/bash

set -euxo pipefail

CC=clang

rm -f *.o client
$CC -c tweetnacl.c -o tweetnacl.o
$CC -Wall -Werror -g -fsanitize=address,undefined -c vrt.c -o vrt.o

$CC -I ../ -Wall -Werror -g -fsanitize=address,undefined -o client examples/vrt_client_unix.c vrt.o tweetnacl.o && ./client


