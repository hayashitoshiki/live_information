class TenFeetController < ApplicationController
  def tenfeet
    @musics =Music.where(artist: "10-FEET")
    $artist = "10-FEET"
  end
end
