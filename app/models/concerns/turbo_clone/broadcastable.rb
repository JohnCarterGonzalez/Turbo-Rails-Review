module TurboClone::Broadcastable
  extend ActiveSupport::Concern

  # will return the pliral model name by default 
  class_methods do
    def broadcast_target_default
      model_name.plural
    end
  end

  # define a broadcast mehtod for the model, return a list of streamables to the target denoted bu the <div id="target"></div>
  def broadcast_append_to(*streamables, target: broadcast_target_default, **rendering)
    TurboClone::StreamsChannel.broadcast_append_to(*streamables, target: target, **broadcast_rendering_with_defaults(rendering))
  end

  def broadcast_prepend_to(*streamables, target: broadcast_target_default, **rendering)
    TurboClone::StreamsChannel.broadcast_prepend_to(*streamables, target: target, **broadcast_rendering_with_defaults(rendering))
  end

  def broadcast_replace_to(*streamables, target: self, **rendering)
    TurboClone::StreamsChannel.broadcast_replace_to(*streamables, target: target, **broadcast_rendering_with_defaults(rendering))
  end

  def broadcast_remove_to(*streamables, target: self)
    TurboClone::StreamsChannel.broadcast_remove_to(*streamables, target: target)
  end

  def broadcast_append_later_to(*streamables, target: broadcast_target_default, **rendering)
    TurboClone::StreamsChannel.broadcast_append_later_to(*streamables, target: target, **broadcast_rendering_with_defaults(rendering))
  end

  def broadcast_prepend_later_to(*streamables, target: broadcast_target_default, **rendering)
    TurboClone::StreamsChannel.broadcast_prepend_later_to(*streamables, target: target, **broadcast_rendering_with_defaults(rendering))
  end

  def broadcast_replace_later_to(*streamables, target: self, **rendering)
    TurboClone::StreamsChannel.broadcast_replace_later_to(*streamables, target: target, **broadcast_rendering_with_defaults(rendering))
  end

  private
  ########################################################################################
  ### returns a sensible default for the target, rendering when the user doesnt provide one
  #########################################################################################

   # if locals are not provided buy the user, then we create the locals option
    # via an empty hash, merge the article key (creaeted wia the model_name.element.to_sym method),
    # additionally, if the user does not provide a partial, we use the to_partial_path method
  def broadcast_rendering_with_defaults(rendering)
    rendering.tap do |r|
      r[:locals] = (r[:locals] || {}).reverse_merge!(model_name.element.to_sym => self)
      r[:partial] ||= to_partial_path
    end
  end

  # articles stream
  def broadcast_target_default
    self.class.broadcast_target_default
  end
end
