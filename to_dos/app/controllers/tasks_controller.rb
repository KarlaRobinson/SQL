class TasksController

  def initialize(arr_of_strings)
    @view = TasksView.new
    @task_str = arr_of_strings[1..-1].join(" ")
    @method = arr_of_strings[0]

    if @method == "add"
      add 
    elsif @method == "index"
      index 
    elsif @method == "delete"
      delete 
    elsif @method == "complete"
      complete 
    else
      @view.error
    end
  end

  def index
    clear_screen!
    @view.index(Task.all)
  end

  def clear_screen!
    print "\e[2J"
    print "\e[H"
  end

  def add
    clear_screen!
    task = Task.create(task_name: @task_str)
    @view.add(task)
    index
  end

  def delete
    num = Task.all[@task_str.to_i - 1].id
    clear_screen!
    task = Task.find(num)
    task.destroy
    @view.delete(task)
    index
  end

  def complete
    num = Task.all[@task_str.to_i - 1].id
    clear_screen!
    task = Task.find(num)
    task.update(task_status: task.task_status ? false : true)
    index
  end
end
