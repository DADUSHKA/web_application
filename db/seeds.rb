# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
[User, Category, Test, Question, Answer].each(&:delete_all)
# . . .
users = User.create!(
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
categories = Category.create!(
  [{title: "Sport"},
   {title: "Avto"},
   {title: "Food"}]
)
tests = Test.create!(
  [{title: "Engine knowledge",
    level: 1,author: users[0],
    category: categories[1]},
   {title: "Driving knowledge",
    level: 2,author: users[0],
    category: categories[1]},
   {title: "Fotbol knowledge",
    level: 1,author: users[0],
    category: categories[0]},
   {title: "Hokey knowledge",
    level: 2,author: users[0],
    category: categories[0]},
   {title: "Knowledge of french cuisine",
    level: 1,author: users[0],
    category: categories[2]},
   {title: "Knowledge of italiano cuisine",
    level: 2,author: users[0],
    category: categories[1]},]
)
questions = Question.create!(
  [{description: "Двигатель бывает дизельный?",
    test: tests[0]},
   {description: "Двигатель бывает молочный?",
    test: tests[0]},
   {description: "Руль находится спереди?",
    test: tests[1]},
   {description: "Колёса бывают квадратные?",
    test: tests[1]},
   {description: "Шайба круглая?",
    test: tests[2]},
   {description: "Хокеист играет в кроссовках?",
    test: tests[2]},
   {description: "Шашлык итальянское блюдо?",
    test: tests[3]},
   {description: "Пицца итальянское блюдо?",
    test: tests[3]},
   {description: "Мяч бывает треугольный?",
    test: tests[4]},
   {description: "Футболист играет в кроссовках?",
    test: tests[4]},
   {description: "Борщ французское блюдо?",
    test: tests[5]},
   {description: "Круасаны французское блюдо?",
    test: tests[5]}]
)
Answer.create!(
  [{question: questions[0]},
   {question: questions[1]},
   {question: questions[2]},
   {question: questions[3]},
   {question: questions[4]},
   {question: questions[5]},
   {question: questions[6]},
   {question: questions[7]},
   {question: questions[8]},
   {question: questions[9]},
   {question: questions[10]},
   {question: questions[11]}]
)
TestsUser.create!(
  [{user: users[1],test: tests[1],finality: true},
   {user: users[2],test: tests[0],finality: true},
   {user: users[1],test: tests[0],finality: false},
   {user: users[1],test: tests[2],finality: true}]
)
