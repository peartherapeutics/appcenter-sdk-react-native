#!/bin/bash
set -e

npm uninstall --save appcenter appcenter-analytics appcenter-auth appcenter-crashes appcenter-push appcenter-data

npm install --save appcenter appcenter-analytics appcenter-auth appcenter-crashes appcenter-push appcenter-data

pod repo update

(cd ios && pod install)

# Temporarily disable linking appcenter-data module due to a bug in linker script
react-native link appcenter appcenter-analytics appcenter-auth appcenter-crashes appcenter-push
