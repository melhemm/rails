users = User.create!([
  { name: 'user', email: 'gmail' }, 
  { name: 'user2', email: 'yahoo' }
])

categories = Category.create!([
  { title: 'Front-end'}, 
  { title: 'back-end'}
])

tests = Test.create!([
  {title: 'Javascript', level: 1, category: Category.find(1), author: User.first},
  {title: 'Rails', level: 2, category: Category.find(2), author: User.first}, 
  {title: 'Node.js', level: 2, category: Category.find(2), author: User.first}
])

questions = Question.create!([
  { body: 'Example ques1', test: Test.find(1)},
  { body: 'Example ques2', test: Test.find(2)},
  { body: 'Example ques3', test: Test.find(2)}
])

answers = Answer.create!([
  { body: 'correct answer', correct: true, question: Question.find(0) }, 
  { body: 'incorrect', correct: false, question: Question.find(0)}, 
  { body: 'incorrect', correct: false, question: Question.find(0)},
  { body: 'incorrect', correct: false, question: Question.find(1)},
  { body: 'correct answer', correct: true, question: Question.find(1) }, 
  { body: 'incorrect', correct: false, question: Question.find(1)}
])
