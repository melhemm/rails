users = User.create!([
  { name: 'user', email: 'gmail' }, 
  { name: 'user2', email: 'yahoo' }
])

categories = Category.create!([
  { title: 'Front-end'}, 
  { title: 'back-end'}
])

tests = Test.create!([
  {title: 'React', level: 1, category: Category.first, author: User.last},
])

questions = Question.create!([
  { body: 'What is React?', test: Test.find(1)},
  { body: 'What is state in React?', test: Test.find(1)},
  { body: 'Why are Redux state functions called reducers?', test: Test.find(1)}
])

answers = Answer.create!([
  { body: 'React is an open-source frontend JavaScript library ', correct: true, question: Question.find(1) }, 
  { body: 'XML-like syntax extension to ECMAScript', correct: false, question: Question.find(1)}, 
  { body: 'An Element is a plain object describing what you want to appear on the screen in terms of the DOM', correct: false, question: Question.find(1)},
  { body: 'object that holds some information that may change over the lifetime of the component.', correct: false, question: Question.find(1)},

  { body: 'State of a component is an object that holds some information that may change over the lifetime of the component. ', correct: true, question: Question.find(2) }, 
  { body: 'An Element is a plain object describing what you want to appear on the screen', correct: false, question: Question.find(2)},
  { body: 'callback function is invoked when setState finished and the component gets rendered', correct: false, question: Question.find(2)},
  
  { body: 'Reducers always return the accumulation of the state (based on all previous and current actions). ', correct: true, question: Question.find(3) }, 
  { body: 'AYou can use redux-thunk middleware which allows you to define async actions.', correct: false, question: Question.find(3)},
  { body: 'Keep your data in the Redux store, and the UI related state internally in the component.', correct: false, question: Question.find(3)}
])