#!/bin/bash
# Installs Square's IntelliJ configs into your user configs.

echo "Installing Oversea Android Code Style ..."

# Config file path
URL="https://raw.githubusercontent.com/kyangc/java-code-styles/master/osandroid.xml"

#Config file name
FILE="OsAndroid.xml"

# Download config
curl --silent -o $FILE $URL

for i in $HOME/Library/Preferences/IntelliJIdea*  \
         $HOME/Library/Preferences/IdeaIC*        \
         $HOME/Library/Preferences/AndroidStudio* \
         $HOME/.IntelliJIdea*/config              \
         $HOME/.IdeaIC*/config                    \
         $HOME/.AndroidStudio*/config
do
  if [[ -d $i ]]; then

    # Copy file into codestyles
    mkdir -p $i/codestyles
    cp -frv ./$FILE $i/codestyles

  fi
done

# Remove source file
rm ./$FILE

echo "Done."
echo ""
echo "Restart IntelliJ and/or AndroidStudio, go to preferences, and apply 'OsAndroid'."
