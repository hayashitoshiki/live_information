class HomeController < ApplicationController
  def top
    require "date"
    d1 = Date.today
    d2 = Date.new(2018 , 7 , 7)
    @sa = (d2 - d1).numerator
  end

  @@artist
  #-------------アーティストページ---------------------
  def dizzysunfist
    @musics = Music.where(artist: "Dizzy Sunfist")
    @@artist = "Dizzy Sunfist"
  end

  def tenfeet
    @musics =Music.where(artist: "10-FEET")
    @@artist = "10-FEET"
  end

  def yabaT
    @musics = Music.where(artist: "yabaT")
    @@artist = "yabaT"
  end
#-----------------編集----------------------------------
  def new
  end

  def create
    @music = Music.new(title:params[:music], kasi:params[:kasi], artist:@@artist)
    @music.save
    if @@artist == "Dizzy Sunfist"
      redirect_to("/Dizzysunfist")
    elsif @@artist == "10-FEET"
      redirect_to("/10-FEET")
    else
      redirect_to("/yabaT")
    end
  end

  def kasi
    @music = Music.find_by(id: params[:id])
  end

  def destroy
    @music = Music.find_by(id:params[:id])
    @music.destroy
    if @@artist == "Dizzy Sunfist"
      redirect_to("/Dizzysunfist")
    elsif @@artist == "10-FEET"
      redirect_to("/10-FEET")
    else
      redirect_to("/yabaT")
    end
  end

  def update
    @music = Music.find_by(id:params[:id])
    @music.kasi = params[:kasi]
    @music.title = params[:title]
    @music.save
    if @@artist == "Dizzy Sunfist"
      redirect_to("/Dizzysunfist")
    elsif @@artist == "10-FEET"
      redirect_to("/10-FEET")
    else
      redirect_to("/yabaT")
    end
  end

  def edit
    @music = Music.find_by(id:params[:id])
  end
end
