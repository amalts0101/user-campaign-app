# Users Campaign Application

## Setup

### Database
1. Setup mysql on local with following commands or if you already have mysql running in local, Skip to Step 3.
2. ```bash
   sudo apt-get install mysql-server mysql-client libmysqlclient-dev
   ```
   Refer to these links if you're having trouble setting up mysql: Link <a href="https://www.atlantic.net/dedicated-server-hosting/using-mysql-with-ruby-on-rails-app-on-ubuntu-22-04/">#1</a> and <a href="https://www.digitalocean.com/community/tutorials/how-to-use-mysql-with-your-ruby-on-rails-application-on-ubuntu-14-04">#2</a>

3. Update `config/database.yml` with your MySQL credentials.

### Application
1. Install Ruby and Rails:
    ```bash
    sudo apt-get install ruby-full
    gem install rails
    ```

2. Clone the repository and install dependencies:
    ```bash
    git clone your-repo-url
    cd users_app
    bundle install
    ```

3. Setup the database:
    ```bash
    rails db:create
    rails db:migrate
    ```

4. Run the application:
    ```bash
    rails server
    ```

### API Endpoints

- List Users: `GET /users`
- Add New User: `POST /users`
  Sample Request body
  ```
  {
    "name": "Alice",
    "email": "alice@gmail.com",
    "campaigns_list": [{"campaign_name": "cam1", "campaign_id": "id1"}, {"campaign_name": "cam3", "campaign_id": "id3"}]
  }
  ```
- Filter Users by Campaign Names: `GET /users/filter?campaign_names=cam1,cam2`

### Access Deployed Application
- The application is deployed on EC2 at: `http://your-ec2-public-ip:3000`
