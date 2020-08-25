class CheckInsController < App

  # GET: /check_ins
  get "/check_ins" do
    erb :"/check_ins/index.html"
  end

  # GET: /check_ins/new
  get "/check_ins/new" do
    erb :"/check_ins/new.html"
  end

  # POST: /check_ins
  post "/check_ins" do
    redirect "/check_ins"
  end

  # GET: /check_ins/5
  get "/check_ins/:id" do
    erb :"/check_ins/show.html"
  end

  # GET: /check_ins/5/edit
  get "/check_ins/:id/edit" do
    erb :"/check_ins/edit.html"
  end

  # PATCH: /check_ins/5
  patch "/check_ins/:id" do
    redirect "/check_ins/:id"
  end

  # DELETE: /check_ins/5/delete
  delete "/check_ins/:id/delete" do
    redirect "/check_ins"
  end
end
