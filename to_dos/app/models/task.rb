class Task < ActiveRecord::Base

# Fíjate en la línea anterior como este modelo está heredando de la clase
# ActiveRecord::Base
# Que tanto código te regala ActiveRecord
  validates :task_name, :presence => true
  validates :task_name, :uniqueness => true

end