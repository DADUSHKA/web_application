# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
[User, Category, Test, Question, Answer].each(&:delete_all)

users = User.create!(
  [{ first_name: 'Vasia',
     password: '111111',
     last_name: 'Pupkin',
     admin_status: true,
     email: 'mail@mail.com',
     encrypted_password: '111111',
     created_at: '2019-01-11 10:21:00.970122',
     updated_at: '2019-01-11 10:26:10.209860',
     sign_in_count: '2',
     current_sign_in_at: '2019-01-11 10:26:10.203857' ,
     last_sign_in_at: '2019-01-11 10:21:10.059776' ,
     last_sign_in_ip: '127.0.0.1' ,
     confirmation_token: 'HbYz-9Cym891JGqnM8KF',
     confirmed_at: '2019-01-11 10:21:04.271154' ,
     confirmation_sent_at: '2019-01-11 10:21:00.970924' ,
     current_sign_in_ip: '127.0.0.1'
      },
   { first_name: 'Sandy',
     password: '111111',
     admin_status: false,
     email: 'sandy@mail.com',
     encrypted_password: '111111',
     created_at: '2019-01-11 10:21:00.970122',
     updated_at: '2019-01-11 10:26:10.209860',
     sign_in_count: '2',
     current_sign_in_at: '2019-01-11 10:26:10.203857' ,
     last_sign_in_at: '2019-01-11 10:21:10.059776' ,
     last_sign_in_ip: '127.0.0.1' ,
     confirmation_token: 'HbYz-9Cym891JGqnM8pF',
     confirmed_at: '2019-01-11 10:21:04.271154' ,
     confirmation_sent_at: '2019-01-11 10:21:00.970924' ,
     current_sign_in_ip: '127.0.0.1'
      }]
)
categories = Category.create!(
  [{ title: 'Sport' },
   { title: 'Avto' },
   { title: 'Food' }]
)
tests = Test.create!(
  [{ title: 'Engine knowledge',
     level: 1, author: users[0],
     category: categories[1] },
   { title: 'Driving knowledge',
     level: 2, author: users[0],
     category: categories[1] },
   { title: 'Fotbol knowledge',
     level: 1, author: users[0],
     category: categories[0] },
   { title: 'Hokey knowledge',
     level: 2, author: users[0],
     category: categories[0] },
   { title: 'Knowledge of french cuisine',
     level: 1, author: users[0],
     category: categories[2] },
   { title: 'Knowledge of italiano cuisine',
     level: 2, author: users[0],
     category: categories[1] }]
)
questions = Question.create!(
  [{ description: 'Двигатель бывает дизельный?',
     test: tests[0] },
   { description: 'Двигатель бывает молочный?',
     test: tests[0] },
   { description: 'Руль находится спереди?',
     test: tests[1] },
   { description: 'Колёса бывают квадратные?',
     test: tests[1] },
   { description: 'Шайба круглая?',
     test: tests[2] },
   { description: 'Хокеист играет в кроссовках?',
     test: tests[2] },
   { description: 'Шашлык итальянское блюдо?',
     test: tests[3] },
   { description: 'Пицца итальянское блюдо?',
     test: tests[3] },
   { description: 'Мяч бывает треугольный?',
     test: tests[4] },
   { description: 'Футболист играет в кроссовках?',
     test: tests[4] },
   { description: 'Борщ французское блюдо?',
     test: tests[5] },
   { description: 'Круасаны французское блюдо?',
     test: tests[5] }]
)
Answer.create!(
  [{ question: questions[0] },
   { question: questions[1] },
   { question: questions[2] },
   { question: questions[3] },
   { question: questions[4] },
   { question: questions[5] },
   { question: questions[6] },
   { question: questions[7] },
   { question: questions[8] },
   { question: questions[9] },
   { question: questions[10] },
   { question: questions[11] }]
)


