class TurboClone::StreamsChannel < ActionCable::Channel::Base
  # for info related to stream names, see ./stream_name.rb
  extend TurboClone::Streams::StreamName
  extend TurboClone::Streams::Broadcasts

  def subscribed
    # accept the sub and stream from the passed params (in this case it will be articles)
    if verified_stream_name = self.class.verified_stream_name(params[:signed_stream_name])
      stream_from verified_stream_name
    else
      reject
    end
  end
end
