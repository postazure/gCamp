# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Quote.create(quote: "Failure is not an option. Everyone has to Succeed", origin: "Arnold Schwarzenegger")
Quote.create(quote: "Your time is limited, so don't waste it living someone else's life.", origin: "Steve Jobs")
Quote.create(quote: "Better Ingredients, Better Pizza", origin: "Papa John's")

Faq.create(question: "What is gCamp?", answer: "gCamp is an awsome tool that is going to change your life. gCamp is your one stop shop to organize all your tasks and documents. You'll also be able to track comments that you and others make. gCamp may eventually replace all need for paper and pens in the entire world. Well, maybe not, but it's going to be pretty cool.")
Faq.create(question: "How do I join gCamp?", answer: "Right now, gCamp is still in production. So, there is not a sign up page open to the public, yet! Your best option is to become super best friends with a gCamp developer. They can be found hanging around gSchool during the day and hitting the hottest clubs at night.")
Faq.create(question: "When will gCamp be finished?", answer: "gCamp is a work in progress. That being said, it should be fully functional by December 2014. Functional. but our developers are going to continue to improve the sight for the foreseeable future. Check in daily for new features and awsome functionality. It's going to blow your mind. Organization is only (well, will only) be a click away. Amazing!")

#^^^^^^^^^^^ Already Seeded ^^^^^^^^^^^^^^^^^^

Role.create(title: "owner")
Role.create(title: "member")
