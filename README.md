# Spendings controller app

App installation on your local device

1. Required tools

* Ruby version: 3.0.0
* Rails version: 7.0.3.1
* PostgreSQL version: 14.4

2. Clone project from git repository and chose directory

```
git clone https://github.com/KaLen9ula/Spending_control.git
cd Spending_control
```

3. Create and setup database and bundle

```
rake db:create
rake db:migrate

bundle install
```

4. Run rails server

```
rails s
```

5. Run specs

```
rspec .
```

Deployed app on heroku: [Spending controller app](https://spendings-controller-app.herokuapp.com/)
