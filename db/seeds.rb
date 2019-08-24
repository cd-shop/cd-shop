# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])


User.create!(:email => "j@j", :name =>"管理",:name_kana => "カンリ", :lastname => "者aa", :lastname_kana => "シャ", admin:true, :password => "aaaaaa", :password_confirmation => "aaaaaa", :tellnumber => "1234567890")