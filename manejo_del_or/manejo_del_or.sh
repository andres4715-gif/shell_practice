#!/usr/bin/env bash

echo "Manejo del ||"

echo "$(pwd)"

cd /Users/ariosmon/Documents/github_personal/shell_practice
echo "Accion 1: $?"
echo "$(pwd)"
cd /Users/ariosmon/Documents/github_personal/shell_practice || exit 
echo "Accion 2: $?"