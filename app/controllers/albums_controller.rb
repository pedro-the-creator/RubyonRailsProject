class AlbumsController < ApplicationController
  before_action :set_album, only: %i[show edit update destroy]

  # GET /albums or /albums.json
  def index
    @albums = Album.all
  end

  # GET /albums/1 or /albums/1.json
  def show
  end

  # GET /albums/new
  def new
    @album_form = AlbumForm.new
  end

  # GET /albums/1/edit
  def edit
    @album_form = AlbumForm.new(album: @album)
  end

  # POST /albums or /albums.json
  def create
    @album_form = AlbumForm.new(album_form_params)

    respond_to do |format|
      if @album_form.save
        format.html { redirect_to album_url(@album_form.album), notice: "Album was successfully created." }
        format.json { render :show, status: :created, location: @album_form.album }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @album_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1 or /albums/1.json
  def update
    @album_form = AlbumForm.new(album: @album, **album_form_params)

    respond_to do |format|
      if @album_form.save
        format.html { redirect_to album_url(@album), notice: "Album was successfully updated." }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @album_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1 or /albums/1.json
  def destroy
    @album.destroy!

    respond_to do |format|
      format.html { redirect_to albums_url, notice: "Album was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_album
    @album = Album.find(params[:id])
  end

  # Permit only the form object parameters
  def album_form_params
    params.require(:album_form).permit(:album_name, :release_year, :band_name)
  end
end
