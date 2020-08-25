module SYO
  class Locations < Grape::API
    resource :locations do

      get :location do
        if params[:id]
          if params[:checkins] == 'true'
            location = Location.find(params[:id])
            checkins = CheckIn.find_by(location_id: params[:id])

            { location: location, checkins: checkins }
          else
            location = Location.find(params[:id])
            location
          end
        else
          locations = Location.all.paginate(page: params[:page], per_page: 20)
          locations
        end
      end

      get :checkins do
        checkins = CheckIn.all
        checkins.paginate(page: params[:page], per_page: 20)
      end

    end

  end
end
