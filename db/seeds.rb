#User.create(username: Faker::Internet.username, email: Faker::Internet.email, password: Faker::Internet.password)

10.times do
    @faker_array = {
        title: Faker::Movies::StarWars.quote,
        planet_1: Faker::Movies::StarWars.planet,
        specie_1: Faker::Movies::StarWars.specie,
        verb_1: Faker::Verb.past, 
        noun_1: Faker::House.furniture,
        specie_2: Faker::Movies::StarWars.specie,
        vehicle_1: Faker::Movies::StarWars.vehicle,
        verb_2: Faker::Verb.past, 
        noun_2: Faker::Food.dish,
        verb_3: Faker::Verb.past, 
        adjective_1: Faker::Color.color_name,
        vehicle_2: Faker::Movies::StarWars.vehicle,
        number_1: Faker::Number.non_zero_digit,
        specie_3: Faker::Movies::StarWars.specie,
        animal_1: Faker::Creature::Animal.name,
        name_1: Faker::FunnyName.three_word_name,
        name_2: Faker::FunnyName.name,
        character_1: Faker::Movies::StarWars.character,
        character_2: Faker::Movies::StarWars.character,
        character_3: Faker::Movies::StarWars.character,
        noun_3: Faker::Hipster.word,
        adjective_2: Faker::Coffee.notes,
        adjective_3: Faker::Nation.nationality,
        noun_4: Faker::House.furniture,
        adjective_4: Faker::Color.color_name,
        verb_4: Faker::Verb.base,
        vehicle_3: Faker::Movies::StarWars.vehicle,
        quote_1: Faker::Movies::StarWars.quote
        }    
end