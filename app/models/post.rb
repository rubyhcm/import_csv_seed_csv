class Post < ApplicationRecord
  has_many :post_categories
  has_many :categories, through: :post_categories

  after_create :tell_telegram_bot

  def tell_telegram_bot
    bot = Rails.application.config.telegram_bot
    token = Rails.application.credentials.dig(:telegram_bot)
    # chat_id = '-4708739989'
    chat_id = '-1002445598588'

    url = Rails.application.routes.url_helpers.post_url(self, host: 'https://0.0.0.0:3000')

    kb = [[
      Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Read Post', url: url),
    ]]

    markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)

    bot.api.send_message(chat_id: chat_id, text: "New post created: *#{title}*", reply_markup: markup, parse_mode: 'Markdown')
  end
end
