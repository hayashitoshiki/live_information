class DizzyController < ApplicationController
  def dizzysunfist
    @musics = Music.where(artist: "Dizzy Sunfist")
    $artist = "Dizzy Sunfist"
  end
end
