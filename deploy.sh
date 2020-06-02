#!/bin/sh
ls -A | grep -Ev "deploy.sh|.git|README.md" | xargs -I{} cp -rv {} $HOME
