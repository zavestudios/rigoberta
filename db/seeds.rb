# frozen_string_literal: true

# Clear existing data for a predictable seed state
Comment.delete_all
Article.delete_all
ActionText::RichText.where(record_type: "Article").delete_all

articles = [
  {
    title: "Rigoberta: a living Rails reference",
    body: "This app is intentionally small. It exists to show *how* we build Rails in 2026."
  },
  {
    title: "Docker-first development",
    body: "Local dev runs in Docker Compose. CI mirrors the same stack and defaults."
  },
  {
    title: "Security as a habit",
    body: "Brakeman and bundler-audit run by default. Fixes stay small and frequent."
  }
]

articles.each do |data|
  article = Article.new(title: data[:title])
  article.content = data[:body]
  article.save!

  2.times do |i|
    article.comments.create!(content: "Comment #{i + 1} on: #{data[:title]}")
  end
end

puts "Seeded #{Article.count} articles and #{Comment.count} comments."
