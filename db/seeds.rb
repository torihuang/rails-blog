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
  Heart.create(heartable: Post.all.to_a.sample)
  Heart.create(heartable: Blog.all.to_a.sample)
  Heart.create(heartable: Comment.all.to_a.sample)
end

20.times do
  Tag.create(topic: Faker::Lorem.word)
end

150.times do
  Taggable.create(tagged: Post.all.to_a.sample, tag: Tag.all.to_a.sample)
end

30.times do
  Taggable.create(tagged: Blog.all.to_a.sample, tag: Tag.all.to_a.sample)
end
