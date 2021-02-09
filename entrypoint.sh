if [ "$GITHUB_REPOSITORY" = "" ]
then
   echo "Missing Environment variable GITHUB_REPOSITORY"
   exit 1
else
   echo "GITHUB_REPOSITORY" is $GITHUB_REPOSITORY 
fi
if [ "$1" = "" ]
then
   echo "usage repository-dispatch ACCESS_TOKEN  EVENT_NAME" 
   exit 1
else
   echo "Github Token Set "
fi
if [ "$2" = "" ]
then 
   echo "usage repository-dispatch ACCESS_TOKEN  EVENT_NAME" 
   exit 1
else
   echo "event_type being fired:" $2 
fi
URL=https://api.github.com/repos/$GITHUB_REPOSITORY/dispatches
echo '{"event_type":' '"'$2'"}' >payload.json 
echo "Authorization: Bearer $1" >header 
curl -X POST --header @header --data  @payload.json $URL
retVal=$?
if [ "$retVal" = 0 ]
then
   RESULT="ok"
else
   RESULT="error"
fi
echo "::set-output name=result::$RESULT"



