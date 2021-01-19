class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(id: nil, name:, type:, db:) 
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db) # uses name & type to creates row in database table
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  end

  def self.find(id, db)   # search db for match using id
    sql = <<-SQL
    SELECT * FROM pokemon
    WHERE id = ?
    SQL
    match = db.execute(sql, id)[0]    # executes the query
    self.new(id: match[0], name: match[1], type: match[2], db: db)   # creates new instance of match
  end
end
