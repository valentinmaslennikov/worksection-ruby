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
### API methods: getting data 
Action | Method | Hash Parameters
-------|--------|-----------
Returns project names, their statuses (archive, active, pending), company and relative reference to the project. |get_projects|
Returns the names of active and closed tasks, priority and relative reference to the task |get_all_tasks||
Returns the names of active tasks, priority and relative reference to the task |get_priority|
Returns the name of the task or subtask, status (active, done), priority and relative reference to the task|get_task|
Returns the costs incurred for the period, their executor (user_from field), corresponding tasks and subtasks (task field). The is_timer=true flag indicates that the time is received from the timer.|get_timemoney|
Returns the text field with user comments|get_comments|
Returns data about all users in account|get_users|

### API methods: creating projects/tasks/comments

Action | Method | Hash Parameters
-------|--------|-----------
Posting a comment in a task or subtask|post_project|{<br>`email_user_from`: (string:required),<br>`email_manager`: (string:required),<br>`email_user_to`: (string:required),<br>`title`: (string:required),<br>`members`: (boolean:optional)<br>}
Creating a task|post_task|
Creating a Subtask|post_subtask|
Placement of time and financial costs in the task or subtask|post_timemoney|
Inviting user to the account|add_user|

### API methods:  editing projects/tasks/subtasks/tags

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

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/worksection-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WorksectionClient project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/worksection-ruby/blob/master/CODE_OF_CONDUCT.md).
