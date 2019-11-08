# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "Criando Tipos"
    Kind.create!([
        {description: 'Amigo'},
        {description: 'Família'},
        {description: 'Conhecido'},
        {description: 'Negócios'}
    ])
p "Tipos criados [OK]"

p "Criando Contatos"
    10.times do |i|
        Contact.create!({
            name: Faker::Name.name,
            email: Faker::Internet.email,
            kind: Kind.all.sample,
            rmk: Faker::Lorem.paragraph([1,2,3,4,5].sample)
        })
    end
p "Contatos criados [OK]"

p "Criando Endereços"
    Contact.all.each do |contact|
        Address.create!({
            street: Faker::Address.street_address,
            city: Faker::Address.city,
            state: Faker::Address.state_abbr,
            contact: contact
        })
    end
p "Endereços criados [OK]"

p "Criando Telefones"
    Contact.all.each do |contact|
        Random.rand(1..5).times do |i|
            Phone.create!({
                phone: Faker::PhoneNumber.cell_phone,
                contact: contact
            })
        end
    end
p "Telefones criados [OK]"