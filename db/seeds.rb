CAMELNAME = %w(Bob Bab Bib Ouali Walle Case Leon John Albert Jean John Fred Seb Claude)
user = User.new(email: 'toto@camel.com')
user.password = '123456'
user.password_confirmation = '123456'
user.save

user2 = User.new(email: 'tata@camel.com')
user2.password = '123456'
user2.password_confirmation = '123456'
user2.save


10.times do
camel = Camel.create!(
name: CAMELNAME.sample,
localisation: Faker::Address.full_address,
number_of_place: [1,2].sample,
food_type: ['Grass','Fruit','Vegetables','Carn'].sample,
color: ['Red','Blue','Camel','Orange','White','Brown'].sample,
user: [User.first,User.last].sample,
wifi: [true,false].sample,
price_per_day: [10,50,100,125,150].sample,
chameaux_fiscaux: [4,5,6,7].sample,
vitesse_max: [5,10,15,20,25,30,50,100].sample
)
end
