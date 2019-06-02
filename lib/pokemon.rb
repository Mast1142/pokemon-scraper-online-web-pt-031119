require 'pry'
class Pokemon
  attr_accessor :name, :type, :id, :db

  def initialize(name:, type:, id: nil, db:)
    @name = name
    @type = type
    @id = id
    @db = db
  end

  def self.save(name, type, db)
    #binding.pry
    db.execute('INSERT INTO pokemon(name, type) VALUES (?, ?)', name, type)
  end

  def self.find(id, db)
    new_pokemon = db.execute('SELECT * FROM pokemon WHERE id = ? LIMIT 1', id).flatten
    #binding.pry
    new_pokemon = self.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], db: db)
  end

#   def self.find_by_name(name)
#     sql = <<-SQL
#       SELECT *
#       FROM students
#       WHERE name = ?
#       SQL
#     DB[:conn].execute(sql, name).map do |row|
#     #binding.pry
#       self.new_from_db(row)
#     end.first
#   end
# end
end
