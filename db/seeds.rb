# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ name: 'user' }, { name: 'user2' }])
categories = Category.create([{ title: 'Front-end' }, { title: 'back-end'}])
tests = Test.create([{title: 'Javascript', level: 1, category_id: categories[0].id}, {title: 'Rails', level: 2, category_id: categories[1].id}, {title: 'Node.js', level: 2, category_id: categories[1].id}])
questions = Category.create([{ body: 'Example ques1', test_id: tests[0].id }, { body: 'Example ques2', test_id: tests[1].id}, { body: 'Example ques3', test_id: tests[1].id}])
answers = Category.create([{ body: 'correct answer', correct: true, question_id: questions[0].id }, { body: 'incorrect', question_id: questions[0].id}, { body: 'incorrect', question_id: questions[0].id}])