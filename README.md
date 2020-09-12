# Community Job Portal
An open source job portal for the communities and by the communties.

## About Community Job Portal

Community Job Portal is about creating a community job platform which will be integrated with all active communities through bots on platforms like - “Slack, Telegram, Zulip, Discord etc. Using these bots, community members of such groups can use some predefined text format to post a job directly to the community job portal which can include a trigger for a bot to post the job. Community members would also be able to create their user profiles on this platform. Based on the posted jobs on the platform, our recommendation systems on the platform will directly notify the right person(fit) for the position who is/are looking for a change. A job aspirant can anytime come on the portal to look for the open job positions and apply for it using the given information.

To understand more about Community Job Portal, please go through with [documentation](https://github.com/HydPy/community-job-portal/wiki) on the wiki, we'll try and keep the documentation updated.

## How to setup the project

### Pre-requitsites

- Docker & Docker Compose should be Installed

Once docker is up and running please clone the repo and follow below steps

```
cd community-job-portal
docker-compise build
docker-compose up -d
docker-compose exec django python ./backend/community_job_portal/manage.py createsuperuser --email <email> --username <username>
docker-compose ps # to see the status of containers
# post this, you shall be able to access the app on http://localhost:8000/
```

## Contributing

To contribute to Community Job Portal :

1. Please make a fork request for this respository, clone your fork.
2. Create a branch with "issue-id" of issue on which you are working, mentioned in name of branch.
3. Make some changes, and submit a pull request.
4. Please first discuss the change you wish to make via issue, or zulip.
5. Please do follow these [guidelines](https://chris.beams.io/posts/git-commit/) for writing good commit messages

## Pull Request Process

1. Please mention the issue id while raising a pull request.
2. Ensure any install or build dependencies are removed before the end of the layer when doing a build.
3. Please make sure that your branch can be merged.
4. Please make sure that your branch compiles and is well tested.
5. Please make sure that your pull request does not have too many commits, squash them while you raise a PR
