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

* <a name="language-use"></a>
  `Use` is a positive instruction.
  <sup>[[link](#language-use)]</sup>
* <a name="language-prefer"></a>
  `Prefer` indicates a better option and its alternative to watch out for.
  <sup>[[link](#language-prefer)]</sup>
* <a name="language-avoid"></a>
  `Avoid` means don't do it unless you have good reason.
  <sup>[[link](#language-avoid)]</sup>
* <a name="language-dont"></a>
  `Don't` means there's never a good reason.
  <sup>[[link](#language-dont)]</sup>

### General

* <a name="general-docs"></a>
  Keep documentation and configuration samples up to date.
  <sup>[[link](#general-docs)]</sup>
* <a name="general-tests"></a>
  Have your changes covered by tests.
  <sup>[[link](#general-tests)]</sup>
* <a name="general-logging"></a>
  Prefer a single log message over multiple messages.
  <sup>[[link](#general-logging)]</sup>
* <a name="general-order-methods"></a>
  Prefer to order methods so that caller methods are earlier in the file than the methods they call.
  <sup>[[link](#general-order-methods)]</sup>
* <a name="general-chatops"></a>
  Prefer to use [ChatOps](https://www.pagerduty.com/blog/what-is-chatops/) to automate processes.
  <sup>[[link](#general-chatops)]</sup>
* <a name="general-gitflow-hooks"></a>
  Prefer to use [gitflow-avh](https://github.com/petervanderdoes/gitflow-avh) with our custom hooks while collaborating with the QA team.
  <sup>[[link](#general-gitflow-hooks)]</sup>
* <a name="general-type-naming"></a>
  Avoid object types in names (`user_array`, `email_method`, `CalculatorClass`, `ReportModule`).
  <sup>[[link](#general-type-naming)]</sup>
* <a name="general-no-monkeys"></a>
  Avoid monkey-patching; try to contribute to open source if you have to.
  <sup>[[link](#general-no-monkeys)]</sup>
* <a name="general-swallowed-exceptions"></a>
  Avoid swallowing exceptions and failing silently.
  <sup>[[link](#general-swallowed-exceptions)]</sup>
* <a name="general-stupid-gems"></a>
  Don't extract you code into a library if it used only in a single project and you are not going to publish it.
  <sup>[[link](#general-stupid-gems)]</sup>
* <a name="general-perform-method"></a>
  Use `perform` method name in backgound job, use_case and command classes
  <sup>[[link](#general-perform-method)]</sup>

### Ruby

* <a name="ruby-style-guide"></a>
  Use [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide) by default, except the guides below.
  <sup>[[link](#ruby-style-guide)]</sup>
* <a name="ruby-version"></a>
  Use the `.ruby-version` file convention to specify the Ruby version for a project.
  <sup>[[link](#ruby-version)]</sup>
* <a name="ruby-line-size"></a>
  Use maximum 120 characters in a single line.
  <sup>[[link](#ruby-line-size)]</sup>
* <a name="ruby-error-class"></a>
  Use `Class.new(StandardError)` instead of inheritance to declare a single-line error class.
  <sup>[[link](#ruby-error-class)]</sup>
* <a name="ruby-di"></a>
  Prefer to use Dependency Injection pattern instead of specifying a hardcoded behavior for the environment.
  <sup>[[link](#ruby-di)]</sup>
* <a name="ruby-acronyms"></a>
  Prefer to use acronyms as words in names (`XmlHttpRequest`, not `XMLHTTPRequest`).
  <sup>[[link](#ruby-acronyms)]</sup>
* <a name="ruby-exception-logging"></a>
  Prefer to log exception with a trace (`logger.error("#{e.inspect}\n#{e.backtrace}")`).
  <sup>[[link](#ruby-exception-logging)]</sup>
* <a name="ruby-scopes"></a>
  Prefer `private` when indicating scope; use `protected` only with comparison methods like `==`.
  <sup>[[link](#ruby-scopes)]</sup>
* <a name="ruby-bracket-blocks"></a>
  Prefer `{}` for multiline blocks in RSpec `let`, `let!` and `ActiveRecord` validations, scopes.
  <sup>[[link](#ruby-bracket-blocks)]</sup>
* <a name="ruby-freeze"></a>
  Prefer to `freeze` all mutable constants.
  <sup>[[link](#ruby-freeze)]</sup>
* <a name="ruby-frozen-strings"></a>
  Prefer to use `# frozen_string_literal: true` with Ruby >= 2.3.
  <sup>[[link](#ruby-frozen-strings)]</sup>
* <a name="ruby-keyword-args"></a>
  Prefer to use keyword arguments if there are more than 2 arguments.
  <sup>[[link](#ruby-keyword-args)]</sup>
* <a name="ruby-string-quotes"></a>
  Prefer single-quoted strings when you don't need string interpolation or special symbols such as `\n`, `'`, etc.
  <sup>[[link](#ruby-string-quotes)]</sup>
* <a name="ruby-method-chaining"></a>
  Prefer to use the `.` on the second line when continuing a chained method invocation on another line.
  <sup>[[link](#ruby-method-chaining)]</sup>
* <a name="ruby-ar-inner-join"></a>
  Prefer to use `joins(:relation)` for `ActiveRecord` models instead of writing SQL queries manually.
  <sup>[[link](#ruby-ar-inner-join)]</sup>
* <a name="ruby-hash-spaces"></a>
  Don't use spaces after `{` and before `}` for hash literals.
  <sup>[[link](#ruby-hash-spaces)]</sup>
* <a name="ruby-timeout"></a>
  Don't use `Timeout`.
  <sup>[[link](#ruby-timeout)]</sup>
* <a name="ruby-constant-reassignment"></a>
  Don't use reassignment of constant
  <sup>[[link](#ruby-constant-reassignment)]</sup>

### Database

* <a name="db-compatible-migrations"></a>
  Avoid having breaking changes in DB migrations, they should work with both versions of code.
  <sup>[[link](#db-compatible-migrations)]</sup>
* <a name="db-migration-app-code"></a>
  Don't use the code from application in migrations if it may be changed.
  <sup>[[link](#db-migration-app-code)]</sup>

### Background Jobs

* <a name="background-jobs-ids"></a>
  Use IDs, not `ActiveRecord` objects for cleaner serialization, then re-find the `ActiveRecord` object in the `perform` method.
  <sup>[[link](#background-jobs-ids)]</sup>
* <a name="background-jobs-methods"></a>
  Use two public methods: `perform`, `perform_async`.
  <sup>[[link](#background-jobs-methods)]</sup>

### Testing

* <a name="testing-not-to"></a>
  Use `not_to` instead of `to_not` in RSpec expectations.
  <sup>[[link](#testing-not-to)]</sup>
* <a name="testing-betterspecs"></a>
  Prefer to follow the [betterspecs.org](http://betterspecs.org/) rules.
  <sup>[[link](#testing-betterspecs)]</sup>
* <a name="testing-instance-double"></a>
  Prefer to use `instance_double` instead of `double` with RSpec.
  <sup>[[link](#testing-instance-double)]</sup>
* <a name="testing-build-stubbed"></a>
  Prefer to use FactoryGirl `build_stubbed` instead of `build` to avoid creating associations.
  <sup>[[link](#testing-build-stubbed)]</sup>
* <a name="testing-factory-assoc"></a>
  Avoid using associations in FactoryGirl, use them in `trait`.
  <sup>[[link](#testing-factory-assoc)]</sup>
* <a name="testing-private-methods"></a>
  Don't test private methods.
  <sup>[[link](#testing-private-methods)]</sup>

### Git

* <a name="git-message-verbs"></a>
  Use simple verbs in commit messages (`Fix`, `Add`, `Refactor`).
  <sup>[[link](#git-message-verbs)]</sup>
* <a name="git-message-task-number"></a>
  Use task number at the beginning of each commit message (`HER-666 Delete app directory`).
  <sup>[[link](#git-message-task-number)]</sup>
* <a name="git-branch-task-number"></a>
  Use task number in branch name if you're using gitflow (`feature/SCD-777_lucky_ticket`).
  <sup>[[link](#git-branch-task-number)]</sup>
* <a name="git-branch-chars"></a>
  Use English characters, digits, `-`, `_`, `/` and `.` in branch names.
  <sup>[[link](#git-branch-chars)]</sup>
* <a name="git-merge-pr"></a>
  Use PR to merge your branch.
  <sup>[[link](#git-merge-pr)]</sup>
* <a name="git-force-push"></a>
  Don't use force push if you opened a PR with reviewers.
  <sup>[[link](#git-force-push)]</sup>

### Code Review

* <a name="review-humble"></a>
  Be humble (`I'm not sure`, `in my opinion`).
  <sup>[[link](#review-humble)]</sup>
* <a name="review-questions"></a>
  Ask questions, but be explicit and describe your point.
  <sup>[[link](#review-questions)]</sup>
* <a name="review-deadline"></a>
  Try to review a complete PR within one day.
  <sup>[[link](#review-deadline)]</sup>
* <a name="review-reply-comments"></a>
  Try to respond to every reviewer's comment.
  <sup>[[link](#review-reply-comments)]</sup>
* <a name="review-talk"></a>
  Talk synchronously (e.g. chat, in person) if there are a lot of disputes, misunderstandings, etc. Post a follow-up comment summarizing the discussion.
  <sup>[[link](#review-talk)]</sup>
* <a name="review-red-pr"></a>
  Don't merge PR if it broke tests on CI.
  <sup>[[link](#review-red-pr)]</sup>
* <a name="review-approve"></a>
  Don't resolve task and don't merge PR without at least one approval.
  <sup>[[link](#review-approve)]</sup>
* <a name="review-changes"></a>
  Avoid changes irrelevant to the task. Open separate PR for refactoring changes.
  <sup>[[link](#review-changes)]</sup>

## Contributing

Bug reports and pull requests are welcome on GitHub. If you want to contribute, please read [CONTRIBUTING.md](./CONTRIBUTING.md).

## License

The gem is available as open source under the terms of the MIT License.
