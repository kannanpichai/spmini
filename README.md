# SmartParking 

The setup steps expect following tools installed on the system.

**Git**

**Ruby 3.1.0**

**Rails 7.0.2.3**

**Postgresql 14.2**

### Installation steps

1. Clone the project and switch project's root directory
```bash
git clone https://github.com/kannanpichai/spmini.git
```

2. Change the Database configuration according to your setup in app/database.yml 


3. Create and setup the database 

```bash
rails db:create
rails db:setup
```

4. Start the Rails server

```bash
rails s
```
