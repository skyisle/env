# create a script that calls launchctl iterating through ~/.launchd.conf
echo '#!/bin/sh

while read line || [[ -n $line ]] ; do launchctl $line ; done < ~/.launchd.conf;
' > /usr/local/bin/launchd.conf.sh

# make it executable
chmod +x /usr/local/bin/launchd.conf.sh

# launch the script at startup
echo '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>launchd.conf</string>
  <key>ProgramArguments</key>
  <array>
    <string>sh</string>
    <string>-c</string>
    <string>/usr/local/bin/launchd.conf.sh</string>
  </array>
  <key>RunAtLoad</key>
  <true/>
</dict>
</plist>
' > ~/Library/LaunchAgents/launchd.conf.plist
