class RolesController < App

  # GET: /roles
  get "/roles" do
    erb :"/roles/index.html"
  end

  # GET: /roles/new
  get "/roles/new" do
    erb :"/roles/new.html"
  end

  # POST: /roles
  post "/roles" do
    redirect "/roles"
  end

  # GET: /roles/5
  get "/roles/:id" do
    erb :"/roles/show.html"
  end

  # GET: /roles/5/edit
  get "/roles/:id/edit" do
    erb :"/roles/edit.html"
  end

  # PATCH: /roles/5
  patch "/roles/:id" do
    redirect "/roles/:id"
  end

  # DELETE: /roles/5/delete
  delete "/roles/:id/delete" do
    redirect "/roles"
  end
end
