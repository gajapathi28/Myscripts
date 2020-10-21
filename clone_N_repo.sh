#script to get all repositories under a user from bitbucket
#Need to add BB Credentials in cache for this script to work
curl -u username https://xxxxxxx.yyy.zzz/rest/api/1.0/projects/DI/repos?limit=2500 > jsoninfo
 
awk -F'"' '{ for(i=1; i<=NF; i++) { if($i ~ /^http/) print $i } } ' jsoninfo  | grep .git > url_list
 
for repo_name in `cat url_list`
do
	        echo "Cloning " $repo_name
		                git clone $repo_name
				        echo "---"
				done
