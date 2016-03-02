require 'random_data'

50.times do
  Post.create!(
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

puts "#{Post.count} posts created"
Post.find_or_create_by(title: "Post Title", body: "Post Body")
puts "#{Post.count} posts created"

puts "#{Comment.count} comments created"
Comment.find_or_create_by(post: Post.find_or_create_by(title: "Post Title", body: "Post Body"), body: "Comment Body")
puts "#{Comment.count} comments created"

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
