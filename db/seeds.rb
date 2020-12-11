10.times do
    User.create(username: Faker::Internet.username, email: Faker::Internet.email, password: Faker::Internet.password)
    Starwar.create(
        title: Faker::Movies::StarWars.unique.quote,
        planet_1: Faker::Movies::StarWars.unique.planet,
        specie_1: Faker::Movies::StarWars.unique.specie,
        verb_1: Faker::Verb.unique.past, 
        noun_1: Faker::House.unique.furniture,
        specie_2: Faker::Movies::StarWars.unique.specie,
        vehicle_1: Faker::Movies::StarWars.unique.vehicle,
        verb_2: Faker::Verb.unique.past, 
        noun_2: Faker::Food.unique.dish,
        verb_3: Faker::Verb.unique.past, 
        adjective_1: Faker::Color.unique.color_name,
        vehicle_2: Faker::Movies::StarWars.unique.vehicle,
        number_1: Faker::Number.unique.non_zero_digit,
        specie_3: Faker::Movies::StarWars.unique.specie,
        animal_1: Faker::Creature::Animal.unique.name,
        name_1: Faker::FunnyName.unique.three_word_name,
        name_2: Faker::FunnyName.unique.name,
        character_1: Faker::Movies::StarWars.unique.character,
        character_2: Faker::Movies::StarWars.unique.character,
        character_3: Faker::Movies::StarWars.unique.character,
        noun_3: Faker::Hipster.unique.word,
        adjective_2: Faker::Coffee.unique.notes,
        adjective_3: Faker::Nation.unique.nationality,
        noun_4: Faker::House.unique.furniture,
        adjective_4: Faker::Color.unique.color_name,
        verb_4: Faker::Verb.unique.base,
        vehicle_3: Faker::Movies::StarWars.unique.vehicle,
        quote_1: Faker::Movies::StarWars.unique.quote,
        user_id: Faker::Number.unique.within(range: 1..10)
    )   
end