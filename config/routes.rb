Rails.application.routes.draw do
 get '/'=> 'home#top'


 post ":artist/create" => "home#create"
 post ":artist/:id/destroy" => "home#destroy"
 get ":artist/add" => "home#new"
 post ":aristst/:id/update" => "home#update"
 get ":artist/:id/edit" => "home#edit"
 get ":artist/:id" => "home#kasi"
 get "Dizzysunfist" => "home#dizzysunfist"
 get "yabaT" => "home#yabaT"
 get "10-FEET" =>"home#tenfeet"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
