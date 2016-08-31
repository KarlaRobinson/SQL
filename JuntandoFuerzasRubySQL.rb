# rake db:drop
# rake db:setup
# rake db:seed

require 'sqlite3'

class Chef

  def initialize(first_name, last_name, birthday, email, phone)
    @first_name = first_name
    @last_name = last_name
    @birthday = birthday
    @email = email
    @phone = phone
  end

  def self.create_table
    Chef.db.execute(
      <<-SQL
        CREATE TABLE IF NOT EXISTS chefs (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          first_name VARCHAR(64) NOT NULL,
          last_name VARCHAR(64) NOT NULL,
          birthday DATE NOT NULL,
          email VARCHAR(64) NOT NULL,
          phone VARCHAR(64) NOT NULL,
          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
      SQL
    )
  end

  def self.seed
    Chef.db.execute(
      <<-SQL
        INSERT INTO chefs
          (first_name, last_name, birthday, email, phone, created_at, updated_at)
        VALUES
          ('Ferran', 'Adriá', '1985-02-09', 'ferran.adria@elbulli.com', '42381093238', DATETIME('now'), DATETIME('now')),
          ('John', 'Deer', '1999-01-13', 'JD@hotmail.com', '55381093138', DATETIME('now'), DATETIME('now')),
          ('Karla', 'Robinson', '1992-13-12', 'karla@g.com', '4561093238', DATETIME('now'), DATETIME('now'));
      SQL
    )
  end

  def self.all
    Chef.db.execute(
    <<-SQL
        SELECT * FROM chefs;
      SQL
    )
  end

  def self.where(column_name, value)
    Chef.db.execute(
    "SELECT * FROM chefs WHERE #{column_name} = '#{value}'"
    )
  end

  # irb Chef.where("id", 1)
  # irb Chef.where("first_name", "Karla")

  # def self.where?(column_name, value)
  #   Chef.db.execute(
  #   "SELECT * FROM chefs WHERE #{column_name} = @ '#{value}'"
  #   )
  # end

  def save
    Chef.db.execute(
        "INSERT INTO chefs
          (first_name, last_name, birthday, email, phone, created_at, updated_at)
        VALUES
          ('#{@first_name}', '#{@last_name}', '#{@birthday}', '#{@email}', '#{@phone}', DATETIME('now'), DATETIME('now'))"
    )
  end
  # chef1 = Chef.new('Paloma', 'Robinson', '1990-05-31', 'palo@g.com', '4563493238')
  # chef1.save
  # Chef.where("first_name","Paloma")

  def self.delete(column_name, value)
    Chef.db.execute(
    "DELETE FROM chefs WHERE #{column_name} = #{value}"
    )
  end

  # Chef.delete("id", "2")

  private
  def self.db
    @@db ||= SQLite3::Database.new("chefs.db")
  end
end



# def initialize
#   Chef.create_table
#   Chef.seed
# end









