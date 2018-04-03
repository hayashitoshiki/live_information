class HomeController < ApplicationController
  @@artist
  def top
    require "date"
    d1 = Date.today
    d2 = Date.new(2018 , 7 , 7)
    @sa = (d2 - d1).numerator
    @artists_1 =Artist.where(switch: 1)
    @artists_0 = Artist.where(switch: 0)
    @user = Artist.new
  end

  def top_create
    @artist = Artist.new(artist:params[:artist], switch:params[:switch])
    @artist.save
    redirect_to("/")
  end

  def top_destroy
    @artist = Artist.find_by(artist:params[:artist], switch:params[:switch])
    if @artist
    @artist.destroy
    end
      redirect_to("/")
  end
#---------------------------楽曲一覧-------------------------------------------
  def music_list
    @musics = Music.order("artist ASC")
    @artist = Music.select("artist").group("artist")
    @@artist = " "
  end
  def music_new
    if params[:example] == "ALL"
        @musics = Music.order("artist asc")
      else
        @musics = Music.where(artist: params[:example])
      end
      @artist = Music.select("artist").group("artist")
      render("home/music_list")
  end

  def top_music_create
    @music = Music.new(title:params[:music], kasi:params[:kasi], artist:params[:artist])
    @music.save
      redirect_to("/home/Mucis_list")
  end


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
    elsif @@artist =="yabaT"
      redirect_to("/yabaT")
    else
      redirect_to("/home/Mucis_list")
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
    elsif @@artist =="yabaT"
      redirect_to("/yabaT")
    else
      redirect_to("/home/Mucis_list")
    end
  end

  def edit
    @music = Music.find_by(id:params[:id])
  end
end
