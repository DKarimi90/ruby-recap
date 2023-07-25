5.times do 
    user = User.create(
        username: Faker::Internet.username, 
        age: rand(20..30), 
        password_digest: Faker::Internet.password, 
        gender: Faker::Gender.binary_type
    )
end

5.times do 
    article = Article.create(
        title: Faker::Lorem.sentence, 
        body: Faker::Lorem.paragraph, 
        category: Faker::Lorem.word, 
        user_id: rand(1..5)
    )
end