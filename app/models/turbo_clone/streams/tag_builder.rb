class TurboClone::Streams::TagBuilder
  include TurboClone::ActionHelper


  def initialize(view_context)
    @view_context = view_context
    @view_context.formats |= [:html]
  end

  # replace method tag builder, generates the action fo replace
  def replace(target, content = nil, **rendering, &block)
    action :replace, target, content, **rendering, &block
  end

  def update(target, content = nil, **rendering, &block)
    action :update, target, content, **rendering, &block
  end

  def prepend(target, content = nil, **rendering, &block)
    action :prepend, target, content, **rendering, &block
  end

  def remove(target)
    action :remove, target
  end

  private

  # render html aprtial, and generate turbo stream tag 
  def action(name, target, content = nil, **rendering, &block)
    template = render_template(target, content, **rendering, &block) unless name == :remove

    turbo_stream_action_tag(name, target: target, template: template)
  end

  # takes the target as an arg and delegates to view_context to render the partial
  def render_template(target, content = nil, **rendering, &block)
    if content
      content.respond_to?(:to_partial_path) ? @view_context.render(partial: content, formats: :html) : content
    elsif block_given?
      @view_context.capture(&block)
    elsif rendering.any?
      @view_context.render(**rendering, formats: :html)
    else
      @view_context.render(partial: target, formats: :html)
    end
  end
end
