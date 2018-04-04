Rails.application.routes.draw do

 get "home/new" => "home#all_music_new"
 get "home/Mucis_list" => "home#music_list"
 post "home/top_music_create" => "home#top_music_create"
 post "home/music_new" => "home#music_new"
 post "home/top_create" => "home#top_create"
 post "home/top_destroy" => "home#top_destroy"
 get '/'=> 'home#top'

 post "music/create" => "home#create"
 post ":artist/:id/destroy" => "home#destroy"
 get ":artist/add" => "home#new"
 post ":aristst/:id/update" => "home#update"
 get ":artist/:id/edit" => "home#edit"
 get ":artist/:id" => "home#kasi"
 get "Dizzysunfist" => "dizzy#dizzysunfist"
 get "yabaT" => "yaba_t#yabaT"
 get "10-FEET" => "ten_feet#tenfeet"

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
