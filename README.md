# WorksectionClient

This is a Ruby gem which integrates worksection API and gives you an efficient way to add worksection data into your project.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'worksection-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install worksection-ruby

## Usage
###API methods: getting data 
Action | Method | Hash Parameters
-------|--------|-----------
Returns project names, their statuses (archive, active, pending), company and relative reference to the project. |get_projects|
Returns the names of active and closed tasks, priority and relative reference to the task |get_all_tasks||
Returns the names of active tasks, priority and relative reference to the task |get_priority|
Returns the name of the task or subtask, status (active, done), priority and relative reference to the task|get_task|
Returns the costs incurred for the period, their executor (user_from field), corresponding tasks and subtasks (task field). The is_timer=true flag indicates that the time is received from the timer.|get_timemoney|
Returns the text field with user comments|get_comments|
Returns data about all users in account|get_users|

###API methods: creating projects/tasks/comments

Action | Method | Hash Parameters
-------|--------|-----------
Posting a comment in a task or subtask|post_project|{<br>`email_user_from`: (string:required),<br>`email_manager`: (string:required),<br>`email_user_to`: (string:required),<br>`title`: (string:required),<br>`members`: (boolean:optional)<br>}
Creating a task|post_task|
Creating a Subtask|post_subtask|
Placement of time and financial costs in the task or subtask|post_timemoney|
Inviting user to the account|add_user|

###API methods:  editing projects/tasks/subtasks/tags

Action | Method | Hash Parameters
-------|--------|-----------
Close a project that corresponds to the page|close_project|
Archives a project that corresponds to the page|activate_project|
Mark as done the task that corresponds to the page. The task should be "in progress" and not contain open subtasks |complete_task|
Mark as done the subtask that corresponds to the page. The subtask must be "in progress" and contain no nested sub-tasks "in progress"|complete_subtask|
Reopening a task that corresponds to the page|reopen_task|
Reopening a subtask that corresponds to the page|reopen_subtask|
Update project|update_project|
Update task|update_task|
Update subtasks|update_subtask|
Update time and financial costs in the task or subtask|update_timemoney|
Delete time and financial costs in the task or subtask|delete_timemoney|
Subscribe user to a task|subscribe|
Unsubscribe user from task|unsubscribe|
Update tags in task/subtask|update_tags|


## Usage examples

````ruby
require "worksection"

DOMAIN_NAME = "<worksection_domain_name>"
WORKSECTION_KEY = "<worksection_api_key>"

client = Worksection::Client.new(DOMAIN_NAME, WORKSECTION_KEY)
````
Here are some common use cases for the Worksection Administrative API (v.05).

### You can list all projects for organization
````ruby
puts "#{ JSON.pretty_generate(client.get_projects)}"
=>
{
  "status": "ok",
  "data": [
    {
      "name": "ProjectName0",
      "page": "/project/61028/",
      "status": "active",
      "company": "CompanyName",
      "user_from": {
        "email": "john.doe@email.com",
        "name": "John Doe"
      },
      "user_to": {
        "email": "john.doe@email.com",
        "name": "John Doe"
      }
    },
    {
      "name": "ProjectName1",
      "page": "/project/46167/",
      "status": "active",
      "company": "CompanyName",
      "user_from": {
        "email": "bob.doe@email.com",
        "name": "Bob Doe"
      },
      "user_to": {
        "email": "bob.doe@email.com",
        "name": "Bob Doe"
      },
      "max_money": 1950
    }
  ]
}

````

### You can list all tasks for organization

````ruby
puts "#{ JSON.pretty_generate(client.get_all_tasks)}"
=>
{
  "status": "ok",
  "data": [
    {
      "name": "Task1",
      "page": "/project/55735/1419268/",
      "status": "active",
      "priority": "1",
      "user_from": {
        "email": "bob.doe@email.com",
        "name": "Bob Doe"
      },
      "user_to": {
        "email": "john.doe@email.com",
        "name": "John Doe"
      },
      "date_added": "2019-08-22 17:41",
      "max_time": 6
    },
    {
      "name": "Task2",
      "page": "/project/61824/1475984/",
      "status": "active",
      "priority": "0",
      "user_from": {
        "email": "john.doe@email.com",
        "name": "John Doe"
      },
      "user_to": {
        "email": "john.doe@email.com",
        "name": "John Doe"
      },
      "date_added": "2019-08-29 18:41"
    }
  ]
}

````
### You can list all time/costs spend by tasks(for example in period)

````ruby
puts "#{ JSON.pretty_generate(client.get_timemoney({datestart: '02.08.2019',dateend: '01.09.2019'}))}"
=>
{
  "status": "ok",
  "data": [
    {
      "id": "761252",
      "task": {
        "page": "/project/61028/1445772/",
        "name": "Task1",
        "status": "active"
      },
      "project": {
        "page": "/project/61028/",
        "name": "ProjectName1"
      },
      "comment": "",
      "time": "0:18",
      "money": "0.00",
      "date": "2019-08-30",
      "is_timer": false,
      "user_from": {
        "email": "john.doe@email.com",
        "name": "John Doe"
      }
    }
  ]
}
````

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/worksection-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WorksectionClient project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/worksection-ruby/blob/master/CODE_OF_CONDUCT.md).
