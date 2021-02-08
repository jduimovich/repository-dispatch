if [ "$GITHUB_REPOSITORY" = "" ]
then
   echo "GITHUB_REPOSITORY does not exist"
else
   echo "GITHUB_REPOSITORY dxists" as $GITHUB_REPOSITORY 
fi

if [ "$1" = "" ]
then
   echo "token does not exist"
else
   echo "token exists" as $1 
fi

if [ "$2" = "" ]
then
   echo "event_type does not exist"
else
   echo "event_type exists" as $2 
fi

URL=https://api.github/com/repos/$GITHUB_REPOSITORY/dispatches
 
D="{'event_type': '$2'}"
echo "$D" >payload.json 
H1="Authorization: Bearer $1" 

echo curl --request POST  --header $H1 --data  @payload.json ---url $URL
curl --request POST  --header $H1 --data  @payload.json ---url $URL
  
RESULT="RAN"
echo "::set-output name=result::$RESULT"



