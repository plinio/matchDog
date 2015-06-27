# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

racas = Raca.create([{nome: 'Poodle'},{nome: 'Border Colie'},{nome: 'Buldog Francês'}])
cidades = Cidade.create([{nome: 'Recife',estado: 'PE'},{nome: 'Blumenau',estado: 'SC'},{nome: 'Videira',estado: 'SC'},{nome: 'Belo Horizonte',estado: 'MG'}])