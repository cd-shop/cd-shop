# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name:"管理者",
            name_kana: "カンリシャ",
            email:"aa@a",
            tellnumber: '09012345678',
            password: 'pppppp',
            password_confirmation: "pppppp",
            admin: true)

Artist.create(:id => 2, :artistname => "西野カナ")
