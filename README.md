## About

In times of form objects and [Law Of Demeter](http://en.wikipedia.org/wiki/Law_of_Demeter) enforcement, `delegate_accessors` comes to rescue dry up your PORO classes.

## Usage

Let's say you are a good boy and uses form objects to handle, for instance, user signs up. Most of the time you'll catch yourself delegating both readers and writers for the target model:

```ruby
class SignupForm
    include ActiveModel::Model
    
    delegate :first_name, :first_name=, to: :user
    delegate :project_name, to: :first_project
    
    def submit
        if valid?
            # whatever your app does
        end
    end
    
    def user
        @user = User.new
    end
    
    def first_project
        @project = Project.new
    end
end
```

This tends to get messy when you delegate more and more attributes:

```ruby
delegate :first_name, :first_name=, :last_name, :last_name=, :age, :age=, :ssn, :ssn=, :facebook_login, :facebook_login=, to: :user
```

You can use `delegate_accessors` to slice the delegate line in half:

```ruby
delegate_accessors :first_name, :last_name, :age, :ssn, :facebook_login, to: :user
```

If you have no ideia what form object are or why they're so important, consider digging these references:

- [ActiveModel Form Objects](http://robots.thoughtbot.com/activemodel-form-objects)
- [7 Patterns to Refactor Fat ActiveRecord Models](http://blog.codeclimate.com/blog/2012/10/17/7-ways-to-decompose-fat-activerecord-models/)
- [Form Object Railscast](http://railscasts.com/episodes/416-form-objects)

## Installation

Add this line to your application's Gemfile:

    gem 'delegate_accessors'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install delegate_accessors


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
