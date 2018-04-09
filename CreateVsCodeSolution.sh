#!/bin/sh
#$1 is the solution name
#$2 is the main project name
#$3 is the main project type e.g. console, classlib, web etc.

echo "Create a folder for the whole solution and create the solution"
mkdir $1
cd $1
dotnet new sln

echo "Create a folder for the main project, then create the main project"
mkdir $2
cd $2
dotnet new $3

echo "Create a folder for the test project, then create the test project"
cd ..
mkdir $2Tests
cd $2Tests
dotnet new mstest

echo "Switch back to the solution folder and add the main project and test project into the solution file"
cd ..
dotnet sln $1.sln add $2/$2.csproj $2Tests/$2Tests.csproj

echo "Switch to the tests project folder and add a Reference to the main project"
cd $2Tests
dotnet add reference ../$2/$2.csproj

echo "Switch back to the solution folder and run the tests"
cd ..
dotnet test $2Tests/$2Tests.csproj


