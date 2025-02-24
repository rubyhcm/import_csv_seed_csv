require 'csv'
require 'open-uri'
namespace :import_csv do
  desc "Import posts daily"
  task posts: :environment do
    filename = File.join Rails.root, "test.csv"

    CSV.foreach(filename, headers: true) do |row|
      title = row['title'] # Access the title using the header name
      body = row['body']   # Access the body using the header name
      category_ids = row['category_id'] # Access the category_id using the header name

      post = Post.new(title:, body:)
      post.save

      #separate string of category ids into array
      a_categories = category_ids.split(",")

      a_categories.each do |category_id|
        post.post_categories.where(category_id:).first_or_create
      end
    end
  end
end
