# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])


User.create!(:email => "pp@pp", :name =>"管理者",:name_kana => "カンリ", :lastname => "者aa", :lastname_kana => "シャ", admin:true, :password => "aaaaaa", :password_confirmation => "aaaaaa", :tellnumber => "1234567890")

User.create!(:email => "oo@oo", :name =>"ユーザー１",:name_kana => "アアアアア", :lastname => "ユーザー１", :lastname_kana => "アアアアア", admin:false, :password => "aaaaaa", :password_confirmation => "aaaaaa", :tellnumber => "1234567891")

User.create!(:email => "ii@ii", :name =>"ユーザー２",:name_kana => "イイイイイ", :lastname => "ユーザー２", :lastname_kana => "イイイイイ", admin:false, :password => "aaaaaa", :password_confirmation => "aaaaaa", :tellnumber => "1234567892")

Genre.create!(:genrename => "J-POP")
Genre.create!(:genrename => "K-POP")

Label.create!(:labelname => "吉本興業")
Label.create!(:labelname => "avex")

Artist.create!(:artistname => "椎名林檎")
Artist.create!(:artistname => "さだまさし")
