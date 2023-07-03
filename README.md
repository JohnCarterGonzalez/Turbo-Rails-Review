# TurboRailsReview
I like to tinker with things to really understand how they work. The turbo-rails gem is no
<br/>
different. At work, our frontend is being built out in Hotwire and even though
<br/>
I work in the backend, I interact with Turbo all day. Here is my in-depth study
<br/>
at reading and writing software to become a better developer.

## Differences between TurboReview and Turbo Rails
I have made some differences along the way to make it easier for me to understand.
app/models/turbo_rails_review/streams/tag_builder.rb, line 19
original:
```ruby
def turbo_stream_tag(action, target:, template:)
    template = "<template>#{template}</template>"

    if target = convert_to_turbo_stream_dom_id_target(target)
      %(<turbo-stream action="#{action}" target="#{target}">#{template}</turbo-stream>)
    else
      raise ArgumentError, 'target must be a string or respond to to_turbo_stream_dom_id'
    end
end
```
Mine:
```ruby
def turbo_stream_tag(action, target:, template:)
  template = "<template>#{template}</template>"

  unless (target = convert_to_turbo_stream_dom_id_target(target))
    raise ArgumentError, 'target must be a string or respond to to_turbo_stream_dom_id'
  end

  %(<turbo-stream action="#{action}" target="#{target}">#{template}</turbo-stream>)
end
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem "turbo_clone"
```

And then execute:
```bash
$ bundle
```

Run the tests, to make sure everything works as expected:
```bash
$ rails test
```

To use it in one of your own projects, first create a rails app:
```bash
$ rails new your_app
```

Then in your `Gemfile`, include the path/to/repo and the `turbo_clone` gem:
```ruby
"turbo_clone" "path/to/repo"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install turbo_clone
```

## Contributing
This is simply a project I took up in my spare time to learn more of how the worker processes and background jobs of Hotwire and specifically turbo works. 
If you see something that needs remeditation, open an issue and I will get back to you as soon as possible. 

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).