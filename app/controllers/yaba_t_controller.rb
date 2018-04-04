class YabaTController < ApplicationController

  def yabaT
    @musics = Music.where(artist: "yabaT")
    $artist = "yabaT"
  end
end
