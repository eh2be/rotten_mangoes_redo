# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    Movie.create!(title: 'The Goonies', director: 'Richard Donner', runtime_in_minutes: 114, description: 'An adventure about some kids in a cave.', poster_image_url: 'http://4.bp.blogspot.com/-hcp1nmEIdrw/UCuSD5YKHnI/AAAAAAAALjU/LOBHs2uPkvU/s1600/The+Goonies+(1985)+5.jpg', release_date: '07/06/1985')
    Movie.create!(title: 'Cue The Muse', director: 'Greg Masuda', runtime_in_minutes: 45, description: 'Four artists, nine commandments of creativity. Boom.', poster_image_url: 'http://payload81.cargocollective.com/1/2/92151/3935717/prt_400x600_1398120888.png', release_date: '15/08/2012')