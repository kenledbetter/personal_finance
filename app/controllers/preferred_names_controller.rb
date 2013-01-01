class PreferredNamesController < ApplicationController
  # GET /preferred_names
  # GET /preferred_names.json
  def index
    @preferred_names = PreferredName.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @preferred_names }
    end
  end

  # GET /preferred_names/1
  # GET /preferred_names/1.json
  def show
    @preferred_name = PreferredName.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @preferred_name }
    end
  end

  # GET /preferred_names/new
  # GET /preferred_names/new.json
  def new
    @preferred_name = PreferredName.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @preferred_name }
    end
  end

  # GET /preferred_names/1/edit
  def edit
    @preferred_name = PreferredName.find(params[:id])
  end

  # POST /preferred_names
  # POST /preferred_names.json
  def create
    @preferred_name = PreferredName.new(params[:preferred_name])

    respond_to do |format|
      if @preferred_name.save
        format.html { redirect_to @preferred_name, notice: 'Preferred name was successfully created.' }
        format.json { render json: @preferred_name, status: :created, location: @preferred_name }
      else
        format.html { render action: "new" }
        format.json { render json: @preferred_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /preferred_names/1
  # PUT /preferred_names/1.json
  def update
    @preferred_name = PreferredName.find(params[:id])

    respond_to do |format|
      if @preferred_name.update_attributes(params[:preferred_name])
        format.html { redirect_to @preferred_name, notice: 'Preferred name was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @preferred_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preferred_names/1
  # DELETE /preferred_names/1.json
  def destroy
    @preferred_name = PreferredName.find(params[:id])
    @preferred_name.destroy

    respond_to do |format|
      format.html { redirect_to preferred_names_url }
      format.json { head :no_content }
    end
  end
end
