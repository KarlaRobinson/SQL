class TasksView
	# Recuerda que la única responsabilidad de la vista es desplegar data al usuario

	def index(task)
    i = 1
    puts "My To-Do List:"
    puts "______________"
    task.each do |item|
    box = item.task_status ? "X" : ""
    puts "#{i}. [#{box}] #{item.task_name} #{item.loc}"
    i += 1
    end
	end

  def add(task)
     puts "Task added: #{task.task_name}"
  end

  def delete(task)
  puts "Task deleted: #{task.task_name}"
    if task.task_status == "true"
      puts "Nice work. This task was completed."
    elsif task.task_status == "false"
      puts "Be careful. This task had not yet been completed."
    end
  end

	def error
    puts "You have entered an invalid command. Try one of the following: 'index', 'add', 'complete', or 'delete'!"
	end
end
