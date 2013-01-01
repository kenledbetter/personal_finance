class MatchedNamesController < ApplicationController
  # GET /matched_names
  # GET /matched_names.json
  def index
    @matched_names = MatchedName.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @matched_names }
    end
  end

  # GET /matched_names/1
  # GET /matched_names/1.json
  def show
    @matched_name = MatchedName.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @matched_name }
    end
  end

  # GET /matched_names/new
  # GET /matched_names/new.json
  def new
    @matched_name = MatchedName.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @matched_name }
    end
  end

  # GET /matched_names/1/edit
  def edit
    @matched_name = MatchedName.find(params[:id])
  end

  # POST /matched_names
  # POST /matched_names.json
  def create
    @matched_name = MatchedName.new(params[:matched_name])

    respond_to do |format|
      if @matched_name.save
        format.html { redirect_to @matched_name, notice: 'Matched name was successfully created.' }
        format.json { render json: @matched_name, status: :created, location: @matched_name }
      else
        format.html { render action: "new" }
        format.json { render json: @matched_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /matched_names/1
  # PUT /matched_names/1.json
  def update
    @matched_name = MatchedName.find(params[:id])

    respond_to do |format|
      if @matched_name.update_attributes(params[:matched_name])
        format.html { redirect_to @matched_name, notice: 'Matched name was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @matched_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matched_names/1
  # DELETE /matched_names/1.json
  def destroy
    @matched_name = MatchedName.find(params[:id])
    @matched_name.destroy

    respond_to do |format|
      format.html { redirect_to matched_names_url }
      format.json { head :no_content }
    end
  end
end
