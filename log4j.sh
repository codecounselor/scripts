#!/bin/bash

# First do the imports because we have to add one for LogManager
oldImport="import org\.apache\.log4j\.Logger;"
newImport="import org\.apache\.logging\.log4j\.LogManager;\\nimport org\.apache\.logging\.log4j\.Logger;"
find . -iname *.java -type f -exec gsed -i "s/${oldImport}/${newImport}/g" {} \;

ktImport="import org\.apache\.log4j\.Logger"
newKtImport="import org\.apache\.logging\.log4j\.LogManager\\nimport org\.apache\.logging\.log4j\.Logger;"
find . -iname *.kt -type f -exec gsed -i "s/${ktImport}/${newKtImport}/g" {} \;

extensions='java kt'
for ext in $extensions
do
  echo "transforming .$ext files..."
  # Then replace everything else
  find . -iname *.$ext -type f -exec gsed -i "s/org\.apache\.log4j/org\.apache\.logging\.log4j/g" {} \;
  find . -iname *.$ext -type f -exec gsed -i "s/Logger\.getLogger/LogManager\.getLogger/g" {} \;

  oldLevel="import org.apache.logging.log4j.Priority"
  newLevel="import org.apache.logging.log4j.Level"
  find . -iname *.$ext -type f -exec gsed -i "s/${oldLevel}/${newLevel}/g" {} \;
  find . -iname *.$ext -type f -exec gsed -i "s/ Priority\./ Level\./g" {} \;

done

# Ask Tom about email appender: https://github.com/SpiderStrategies/Scoreboard/commit/650aa6fe659f9d27251e96b9d383e45a4e146a49
