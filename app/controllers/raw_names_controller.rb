class RawNamesController < ApplicationController
  # GET /raw_names
  # GET /raw_names.json
  def index
    @raw_names = RawName.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @raw_names }
    end
  end

  # GET /raw_names/1
  # GET /raw_names/1.json
  def show
    @raw_name = RawName.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @raw_name }
    end
  end

  # GET /raw_names/new
  # GET /raw_names/new.json
  def new
    @raw_name = RawName.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @raw_name }
    end
  end

  # GET /raw_names/1/edit
  def edit
    @raw_name = RawName.find(params[:id])
  end

  # POST /raw_names
  # POST /raw_names.json
  def create
    @raw_name = RawName.new(params[:raw_name])

    respond_to do |format|
      if @raw_name.save
        format.html { redirect_to @raw_name, notice: 'Raw name was successfully created.' }
        format.json { render json: @raw_name, status: :created, location: @raw_name }
      else
        format.html { render action: "new" }
        format.json { render json: @raw_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /raw_names/1
  # PUT /raw_names/1.json
  def update
    @raw_name = RawName.find(params[:id])

    respond_to do |format|
      if @raw_name.update_attributes(params[:raw_name])
        format.html { redirect_to @raw_name, notice: 'Raw name was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @raw_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raw_names/1
  # DELETE /raw_names/1.json
  def destroy
    @raw_name = RawName.find(params[:id])
    @raw_name.destroy

    respond_to do |format|
      format.html { redirect_to raw_names_url }
      format.json { head :no_content }
    end
  end
end
