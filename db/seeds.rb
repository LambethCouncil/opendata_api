# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Data categories (only for Location data at the moment)

categories = Category.create([
    { title: 'Food Growing Projects' },
    { title: 'Adventure Playgrounds' },
    { title: 'Libraries' },
    { title: 'Community Toilets' },
    { title: 'Recycling Banks' }
])