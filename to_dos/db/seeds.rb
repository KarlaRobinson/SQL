# Este archivo sirve para crear registros de prueba

task = Task.create(task_name: "Go shopping").save
task = Task.create(task_name: "Call Bob").save
task = Task.create(task_name: "Make salad").save
task = Task.create(task_name: "Cry because there are no tomatoes").save
task = Task.create(task_name: "Add 'buy tomatoes' to to-do list").save
task = Task.create(task_name: "Buy tomatoes").save
task = Task.create(task_name: "Make salad again, with tomatoes").save
task = Task.create(task_name: "Wash bowl").save
task = Task.create(task_name: "Go out for icecream").save
task = Task.create(task_name: "Make doctors appt for stomach ache").save
task = Task.create(task_name: "Pay hospital bill").save
task = Task.create(task_name: "Rent a movie").save
task = Task.create(task_name: "Write review on Rotten Tomatoes that the movie was lame").save
task = Task.create(task_name: "Look for a better movie").save


p Task.all
