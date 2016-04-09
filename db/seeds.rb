User.create(username: 'torihuang', email: 'tori@gmail.com', password: 'password', birthday: Date.today)
User.create(username: 'lissielou', email: 'lissie@gmail.com', password: 'password', birthday: Date.today)

Blog.create(author_id: 1, title: "Triathlons", description: "How to be super fast and awesome")
Blog.create(author_id: 1, title: "Dogs", description: "The are cute fo sho")

Blog.create(author_id: 2, title: "Art History", description: "Pretty colors and other art stuff")
Blog.create(author_id: 2, title: "Ramen", description: "OMG")


Blog.all.to_a.each do |blog|
  10.times do
    blog.posts << Post.create(title: Faker::Lorem.sentence(3, true, 4), content: Faker::Lorem.paragraph(2))
  end
end

Post.all.to_a.each do |post|
  10.times do
    post.comments << Comment.create(author_id: [1,2,3,4].sample, content: Faker::Lorem.paragraph)
  end
end

50.times do
  Heart.create(post: (1..40).to_a.sample, heartable_type: 'post')
  Heart.create(blog: (1..4).to_a.sample, heartable_type: 'blog')
  Heart.create(comment: (1..400).to_a.sample, heartable_type: 'comment')
end

20.times do
  Tag.create(topic: Faker::Lorem.word)
end

150.times do
  Taggable.create(tagged_type: 'post', tag: Tag.all.to_a.sample, post: Post.all.to_a.sample)
end

30.times do
  Taggable.create(tagged_type: 'blog', tag: Tag.all.to_a.sample, blog: Blog.all.to_a.sample)
end
