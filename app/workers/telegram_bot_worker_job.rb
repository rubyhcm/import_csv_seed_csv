class TelegramBotWorkerJob
  include Sidekiq::Worker
  sidekiq_options retry: false


  def perform(token)
    puts "Starting telegram bot..."
    Rails.logger.info "Starting telegram bot..."

    telegram_bot = TelegramBotter.new
    telegram_bot.start_bot(token)
  end
end
