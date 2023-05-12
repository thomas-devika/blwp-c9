#!/usr/bin/env bash

echo
printf "\033[32m%s\033[39m\n" "Welcome to Baseline Webpage"
echo "---------------------------"
echo
echo "Lets setup your new website"
echo
printf "Enter the name of your new website (e.g. my-new-website): "
read -r PROJECT_NAME
echo
echo "Awesome, lets set a region where the website will be hosted!"
echo
echo "AWS uses regions to store your website, you can find a list of regions here: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-available-regions"
echo
echo "The default region is [$(aws configure get region)], leave blank to continue using it."
printf "> "
read -r NEW_REGION
if [ -z "$NEW_REGION" ]; then
    echo "Using default region [$(aws configure get region)]"
fi
echo
echo "Great, lets get started!"
echo
echo "You can start by running [npm run deploy:staging] to deploy your website to AWS."
echo
echo "Or you can start the site locally with [npm start]"
echo
printf "\033[32m%s\033[39m\n" "Happy coding!"
sed -i '' -e "s|baseline-webpage|$PROJECT_NAME|g" serverless.yml >/dev/null 2>&1
if [ "$NEW_REGION" ]; then
    sed -i '' -e "s|\$(aws configure get region)|$NEW_REGION|g" package.json >/dev/null 2>&1
fi
