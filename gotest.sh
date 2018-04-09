#!/bin/sh
a=$1
go test ${a%/*}
