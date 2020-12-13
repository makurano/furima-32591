FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birthday { '1996-11-28' }

    transient do
      person { Gimei.name }
    end
    last_name           { person.last.kanji }
    last_name_katakana  { person.last.katakana }
    first_name          { person.first.kanji }
    first_name_katakana { person.first.katakana }
  end
end
