class CountdownJob < ApplicationJob
  queue_as :default

  def perform()
    (0..9).each do |i|
      sleep 1
      Turbo::StreamsChannel.broadcast_update_to(:countdown,
      target: "countdown-text",
      partial: "pages/countdown",
      locals: { number: i + 1 })
    end

    Turbo::StreamsChannel.broadcast_update_to(:countdown,
      target: "countdown-text",
      partial: "pages/home_buttons")
  end
end
