# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Category.delete_all
Test.delete_all
Question.delete_all
Answer.delete_all
# . . .
User.create!(
  [{name: "Vasia",
    login_status: "user",
    email: "mail@mail.com",
    password: "qwerty"},
   {name: "Pit",
    login_status: "user",
    email: "mail@mail.ru",
    password: "12345"},
   {name: "Bob",
    login_status: "admin",
    email: "bob@mail.com",
    password: "afdfe333f"},
   {name: "Sandy",
    login_status: "user",
    email: "sandy@mail.com",
    password: "q3we9rty"}]
)
Category.create!(
  [{title: "Sport"},
   {title: "Avto"},
   {title: "Food"}]
)
Test.create!(
  [{title: "Engine knowledge",
    level: 1,
    category_id: 2},
   {title: "Driving knowledge",
    level: 2,
    category_id: 2},
   {title: "Fotbol knowledge",
    level: 1,
    category_id: 1},
   {title: "Hokey knowledge",
    level: 2,
    category_id: 1},
   {title: "Knowledge of french cuisine",
    level: 1,
    category_id: 3},
   {title: "Knowledge of italiano cuisine",
    level: 2,
    category_id: 3}]
)
Question.create!(
  [{description: "Двигатель бывает дизельный?",
    test_id: 1},
   {description: "Двигатель бывает молочный?",
    test_id: 1},
   {description: "Руль находится спереди?",
    test_id: 2},
   {description: "Колёса бывают квадратные?",
    test_id: 2},
   {description: "Шайба круглая?",
    test_id: 4},
   {description: "Хокеист играет в кроссовках?",
    test_id: 4},
   {description: "Шашлык итальянское блюдо?",
    test_id: 6},
   {description: "Пицца итальянское блюдо?",
    test_id: 6},
   {description: "Мяч бывает треугольный?",
    test_id: 3},
   {description: "Футболист играет в кроссовках?",
    test_id: 3},
   {description: "Борщ французское блюдо?",
    test_id: 5},
   {description: "Круасаны французское блюдо?",
    test_id: 5}]
)
Answer.create!
