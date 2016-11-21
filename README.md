# Best Practices

Guides for getting things done, programming well, and programming in style.

* [General](#general)
* [Ruby](#ruby)
* [Database](#database)
* [Background Jobs](#background-jobs)
* [Testing](#testing)
* [Git](#git)
* [Code Review](#code-review)

A note on the language:

* `Use` is a positive instruction.
* `Prefer` indicates a better option and its alternative to watch out for.
* `Avoid` means don't do it unless you have good reason.
* `Don't` means there's never a good reason.

### General

* Keep documentation and configuration samples up to date.
* Have your changes covered by tests.
* Prefer a single log message over multiple messages.
* Prefer to order methods so that caller methods are earlier in the file than the methods they call.
* Prefer to use [ChatOps](https://www.pagerduty.com/blog/what-is-chatops/) to automate processes.
* Prefer to use [gitflow-avh](https://github.com/petervanderdoes/gitflow-avh) with our custom hooks while collaborating with the QA team.
* Avoid object types in names (`user_array`, `email_method`, `CalculatorClass`, `ReportModule`).
* Avoid monkey-patching; try to contribute to open source if you have to.
* Avoid swallowing exceptions and failing silently.
* Avoid having breaking changes in DB migrations, they should work with both versions of code.
* Don't extract you code into a library if it used only in a single project and you are not going to publish it.
* Use `perform` method name in backgound job, use_case and command classes
* Use `perform_async` method name in backgound job to schedule async run

### Ruby

* Use [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide) by default, except the guides below.
* Use the `.ruby-version` file convention to specify the Ruby version for a project.
* Use maximum 120 characters in a single line.
* Use `Class.new(StandardError)` instead of inheritance to declare a single-line error class.
* Prefer to use acronyms as words in names (`XmlHttpRequest`, not `XMLHTTPRequest`).
* Prefer to log exception with a trace (`logger.error("#{e.inspect}\n#{e.backtrace}")`).
* Prefer `private` when indicating scope; use `protected` only with comparison methods like `==`.
* Prefer `{}` for multiline blocks in RSpec `let`, `let!` and `ActiveRecord` validations, scopes.
* Prefer to `freeze` all mutable constants.
* Prefer to use `# frozen_string_literal: true` with Ruby >= 2.3.
* Prefer to use keyword arguments if there are more than 2 arguments.
* Prefer single-quoted strings when you don't need string interpolation or special symbols such as `\n`, `'`, etc.
* Prefer to use the `.` on the second line when continuing a chained method invocation on another line.
* Don't use spaces after `{` and before `}` for hash literals.
* Don't use `Timeout`.

### Database

* Don't use the code from application in migrations if it may be changed.

### Background Jobs

* Use IDs, not `ActiveRecord` objects for cleaner serialization, then re-find the `ActiveRecord` object in the `perform` method.
* Use two public methods: `perform`, `perform_async`.

### Testing

* Use `not_to` instead of `to_not` in RSpec expectations.
* Prefer to follow the [betterspecs.org](http://betterspecs.org/) rules.
* Prefer to use `instance_double` instead of `double` with RSpec.
* Avoid using associations in `FactoryGirl`, use them in `trait`.
* Don't test private methods.

### Git

* Use simple verbs in commit messages (`Fix`, `Add`, `Refactor`).
* Use task number at the beginning of each commit message (`HER-666 Delete app directory`).
* Use task number in branch name if you're using gitflow (`feature/SCD-777_lucky_ticket`).
* Use English characters, digits, `-`, `_`, `/` and `.` in branch names.
* Use PR to merge your branch.
* Don't use force push if you opened a PR with reviewers.

### Code Review

* Be humble (`I'm not sure`, `in my opinion`).
* Ask questions, but be explicit and describe your point.
* Try to review a complete PR within one day.
* Try to respond to every reviewer's comment.
* Talk synchronously (e.g. chat, in person) if there are a lot of disputes, misunderstandings, etc. Post a follow-up comment summarizing the discussion.
* Don't merge PR if it broke tests on CI.
* Don't resolve task and don't merge PR without at least one approval.

## Contributing

Bug reports and pull requests are welcome on GitHub. If you want to contribute, please read [CONTRIBUTING.md](./CONTRIBUTING.md).

## License

The gem is available as open source under the terms of the MIT License.
