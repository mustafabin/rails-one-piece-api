puts "deleting users and devil DevilFruits..."
User.destroy_all
DevilFruit.destroy_all

puts "creating users and devil DevilFruits..."
10.times do
    name = Faker::JapaneseMedia::OnePiece.character
    new_user = User.create(name: name,email: "#{name.delete(' ')}@bounty.com", password: "123", quote: Faker::JapaneseMedia::OnePiece.quote)
    DevilFruit.create(name: Faker::JapaneseMedia::OnePiece.akuma_no_mi, user_id: new_user.id, type: "")
end

  
puts "seeded successfully 👒🏴‍☠️"