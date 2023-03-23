# docker-compose-jenkins-python

An implementation of a custom Jenkins server running as a container using docker compose.
The Jenkins server is pre-configure with one job that will run a `Jenkinsfile` pipeline
that executes python script `main.py`


## Build docker image
`docker compose build`

## Run the system
`docker compose up`

## Files
- `python-job.xml` The pre-configured Jenkins job in xml format
- `Dockerfile` The implementation of a custom Jenkins docker image that runs without the need of installation wizard configuration
- `default-user.groovy` A groovy file that sets the default user and password for the Jenkins server (`admin / admin`)
- `main.py` A simple python script that prints `Devops is great`
- `JenkinsFile` The Jenkins pipeline implementation
- `docker-compose.yaml` The Docker Compose implementaion file for creating the volume, network and port mapping for the system

## Notes

Assuming the repository is on github there are few options to run the pipeline on merge request
Follow the steps below:

1. In Jenkins goto `Dashboard->People->admin->Configure->API Token->Add new Token` and click on Generate
   - Configure Jenkins `python-job` to `Trigger build remotely` and set the `Authentication Token` value to the token value
   - Create a webhook on the github repository (goto setting->webhooks->Add webhook)
   - set Payload url to: `JENKINS_URL:8080/job/python-job/build?token=TOKEN_NAME`
   - in the `Which events would you like to trigger this webhook?` set the appropriate event

2. Create a webhook on the github repository (goto setting->webhooks->Add webhook)
   - set Payload url to: http://[jenkins-server-fqdn]/github-webhook/
   - in the `Which events would you like to trigger this webhook?` set the appropriate event 

3. Create a GitHub Action as described [here](https://github.com/appleboy/jenkins-action)

Another option could be using a local git repo
- create `post-merge` file under `.git/hooks ` folder and set it to be executable
```
$ chmod +x .git/hooks/post-merge
```
puth the following content in `post-merge` file and replace the X with the secured token generated in Jenkins
```
#!/bin/bash
exec < /dev/tty

# Get the current branch name
branch_name=$(git branch | grep "*" | sed "s/\* //")

# Get the name of the branch that was just merged
reflog_message=$(git reflog -1)
merged_branch_name=$(echo $reflog_message | cut -d" " -f 4 | sed "s/://")

echo $merged_branch_name
echo "post-merge"
curl -X POST http://localhost:8080/job/python-job/build/build?token=X --user admin:X
```

## Shutdown:

`docker compose down`
