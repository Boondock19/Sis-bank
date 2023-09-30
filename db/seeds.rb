# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

PersonType.destroy_all
User.destroy_all

PersonType.create!([{
    letter: 'V'
},{
    letter: 'E'
},{
    letter: 'P'
},{
    letter: 'J'
},{
    letter: 'G'
},])


User.create!([{
    indentificationNumber: '12345678',
    startDate: '2021-09-29',
    endDate: '2021-09-29',
    name: 'Luis Raúl',
    email: "jose@gmail.com",
    mainNumber: '04141234567',
    optNumber: '04141234567',
    person_type_id: 56
},{
    indentificationNumber: '2321656',
    startDate: '2021-09-29',
    endDate: '2021-09-29',
    name: 'Ñapa',
    email: "matias@gmail.co",
    mainNumber: '04141234567',
    optNumber: '04141234567',
    person_type_id: 57
}
])