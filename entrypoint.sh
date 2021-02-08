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

URL="https://api.github/com/repos/$GITHUB_REPOSITORY/dispatches"
PAT=$1
D="{'event_type': '$2'}"
 
H1="Authorization: Bearer $PAT"
H2="Accept: 'application/vnd.github.v3+json'"
H3="Content-Type: 'application/json'"

echo curl -d "$D" -H "$H1" -H "$H2" -H "$H3" -X POST $URL

RESULT="RAN"
echo "::set-output name=result::$RESULT"



