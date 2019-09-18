require 'sinatra'
# Your app

def get_todos
  @@todos ||= []
end

def add_to_todo(todo)
  get_todos().push(todo)
end

def del_todo
  get_todos().slice!(@id.to_i - 1)
end

def get_todo
  get_todos()[@id.to_i - 1]
end

def update_to_todo(title)
  get_todos()[@id.to_i - 1] = {title => get_todos()[@id.to_i - 1].values[0]}
end


get "/todos" do
  @todos = get_todos()
  erb :todos
end


post "/todos" do
  todo = {params[:title] => params[:date]}
  add_to_todo(todo)
  redirect "/todos"
end


get "/todos/:id" do
  @id = params[:id]
  @todo = get_todo()
  erb :todo
end


put "/todos/:id" do
  @id = params[:id]
  update_to_todo(params[:title])
  redirect "/todos"
end


delete "/todos/:id" do
  @id = params[:id]
  del_todo()
  redirect "/todos"
end