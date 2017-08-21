require "sinatra"
require "make_todo"

get "/" do
	@tareas = Tarea.all 
	erb :index  
end

post "/" do
	Tarea.create(params[:title])
	@tareas = Tarea.all
	redirect "/"    
end

get "/done/:id" do
	Tarea.update(params[:id])
	redirect "/"
end

get "/delete/:id" do
	Tarea.destroy(params[:id])
	redirect "/"
end

#[{"id"=>4412, "title"=>"Tarea numero 1", "done"=>false,
#"created_at"=>"2017-08-20T10:19:16.834Z", "updated_at"=>"2017-08-20T10:19:16.834Z"}]
