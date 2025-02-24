class PostCategory < ApplicationRecord
  belongs_to :post
  belongs_to :category

  # category = Category.create(name: "Technology")
  # post = Post.create(title: "New Tech Trends", body: "Content about tech trends.")
  # post.categories << category
end
