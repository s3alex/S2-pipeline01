#! /bin/bash
# Checking if file.txt is a file


if 
[[ -s file.txt ]]
then 
echo "file.txt is a file and greater than 0"
else 
echo "file.txt is not a file or is empty"
exit 1
fi 


# # Checking if file.txt exist
# if 
# [[ -z file.txt ]]
# then 
# echo "the file exist"
# else 
# echo "file.txt missing"
# exit 1
# fi 

# checking if file.txt size is greater than 0 

TAG=$(cat file.txt) 

GIT=$(git tag | grep -w $TAG )

if 
[[ ${GIT} == $TAG ]]
then 
echo "The tag exist"
exit 1
fi 



if [[ ${TAG::1} == "v" ]]
then
  echo "the tag $TAG is valid"
else
  echo "Wrong tag"
  exit 1
fi
