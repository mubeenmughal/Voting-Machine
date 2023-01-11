# README
##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.7.2](https://github.com/anasahmad05/project-name/voting-machine/.ruby-version#L1)
- Rails [5.2.0](https://github.com/anasahmad05/project-name/voting-machine/Gemfile#L12)
- Cloudinary

##### 1. Check out the repository

```bash
git clone git@github.com:anasahmad05/voting-machine.git
```

##### 2. Create database.yml file

Copy the sample database.yml file and edit the database configuration as required.

```bash
cp config/database.yml.sample config/database.yml
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
bundle exec rake db:seed
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```bash
bundle exec rails s
```
##### 5. Env variables

Create application.yml file and define env variables
```bash
gmail_email:
gmail_password:
db_username:
db_password:
cloud_api_key:
cloud_api_secret:
```

```bash
And now you can visit the site with the URL http://localhost:3000
```
