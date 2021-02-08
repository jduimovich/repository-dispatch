

if [ "$GITHUB_REPOSITORY" = "" ]
then
   echo "GITHUB_REPOSITORY Does not exist"
else
   echo "GITHUB_REPOSITORY Exists" as $GITHUB_REPOSITORY 
fi

if [ "$1" = "" ]
then
   echo "PARAM1 Does not exist"
else
   echo "PARAM1 Exists" as $1 
fi
curl https://northdepot.ca

RESULT="this worked"
echo "::set-output name=result::$RESULT"



