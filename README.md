# TurboRailsReview
I like to tinker with things to really understand how they work. The turbo-rails gem is no
<br/>
different. At work, our frontend is being built out in Hotwire and even though
<br/>
I work in the backend, I interact with Turbo all day. Here is my in-depth study
<br/>
at reading and writing software to become a better developer.

## Differences between TurboReview and Turbo Rails
In no way do I claim to be a superior developer to the ones who built Turbo Rails. I have made some differences along the way to make it easier for me to understand.
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
gem "turbo_rails_review"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install turbo_rails_review
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
