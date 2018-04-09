#!/bin/sh
a=$1
echo ${a%/*.csproj}
dotnet test
