# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.create!(name: "UI/UX")
Category.create!(name: "Data Science ")
Category.create!(name: "Full Stack Engineering")
Category.create!(name: "Mobile Specialist")
Category.create!(name: "DevOps")
Category.create!(name: "Machine Learning")

experience_array = ["Began career as a theoretical physicist at MIT, but after creating a widely-used system for data analysis, realized that building apps for humans was more rewarding that academic research.", "Spent the last five years designing developing and marketing products for companies ranging from game studios to startups to Fortune 100 companies.", "Expertise in building educational frameworks for the past five years", "Worked in the London-based Google DeepMind team developing the most advanced AI to date, using the highly complex Monaco Algorithm.", "Consummate learner of all things.", "Active in data science and open source communities.", "Coauthored the original portfolio management and testing packages for R: 'portfolio' (the first R package to include a treemap function) and 'backtest'.", "Prior to becoming a Super Coder, worked at Microsoft and CapitalOne as an architect to their big data systems.", "Passionate about multivariable calculus and linear algebra, and interned as a particle physicist at the CERN before life as a Super Coder.", "Past work building the neural network that learns how to play video games in a fashion similar to that of human, as well as a neural network that may be able to access an external memory like a conventional Turing machine.", "Worked at University College London's Gatsby Computational Neuroscience Unit, building machines with neural network that access external memory like a conventional Turing machine, resulting in a computer that mimics the short-term of a human brain.", "Wants to wonk to 'solve intelligence,' by trying to achieve the best techniques from machine learning and systems neuroscience to build powerful general-purpose learning algorithms.", "A child chess prodigy who won the Pentamind championship at the Mind Sports Olympiad five times, and now works to solve intelligene." ]

cost_array = ["120000.00", "125000.00", "127500.00", "130000.00", "132500.00", "135000.00", "137000.00", "139000.00", "140000.00", "145000.00", "100000.00", "125000.00", "200000.00", "225000.00", "500000.00"]

50.times do
  Coder.create!(name: Faker::Name.name[0][0] + " "  + Faker::Name.name.split[1],
                experience: experience_array.sample(2).join(" "),
                cost: cost_array.sample,
                image_url: "http://api.randomuser.me/portraits/thumb/#{['men', 'women'].sample}/#{rand(96)}.jpg",
                category: Category.all.order("Random()").first)
end
