class RawToFinalNameMappingsController < ApplicationController
  # GET /raw_to_final_name_mappings
  # GET /raw_to_final_name_mappings.json
  def index
    @raw_to_final_name_mappings = RawToFinalNameMapping.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @raw_to_final_name_mappings }
    end
  end

  # GET /raw_to_final_name_mappings/1
  # GET /raw_to_final_name_mappings/1.json
  def show
    @raw_to_final_name_mapping = RawToFinalNameMapping.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @raw_to_final_name_mapping }
    end
  end

  # GET /raw_to_final_name_mappings/new
  # GET /raw_to_final_name_mappings/new.json
  def new
    @raw_to_final_name_mapping = RawToFinalNameMapping.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @raw_to_final_name_mapping }
    end
  end

  # GET /raw_to_final_name_mappings/1/edit
  def edit
    @raw_to_final_name_mapping = RawToFinalNameMapping.find(params[:id])
  end

  # POST /raw_to_final_name_mappings
  # POST /raw_to_final_name_mappings.json
  def create
    @raw_to_final_name_mapping = RawToFinalNameMapping.new(params[:raw_to_final_name_mapping])

    respond_to do |format|
      if @raw_to_final_name_mapping.save
        format.html { redirect_to @raw_to_final_name_mapping, notice: 'Raw to final name mapping was successfully created.' }
        format.json { render json: @raw_to_final_name_mapping, status: :created, location: @raw_to_final_name_mapping }
      else
        format.html { render action: "new" }
        format.json { render json: @raw_to_final_name_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /raw_to_final_name_mappings/1
  # PUT /raw_to_final_name_mappings/1.json
  def update
    @raw_to_final_name_mapping = RawToFinalNameMapping.find(params[:id])

    respond_to do |format|
      if @raw_to_final_name_mapping.update_attributes(params[:raw_to_final_name_mapping])
        format.html { redirect_to @raw_to_final_name_mapping, notice: 'Raw to final name mapping was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @raw_to_final_name_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raw_to_final_name_mappings/1
  # DELETE /raw_to_final_name_mappings/1.json
  def destroy
    @raw_to_final_name_mapping = RawToFinalNameMapping.find(params[:id])
    @raw_to_final_name_mapping.destroy

    respond_to do |format|
      format.html { redirect_to raw_to_final_name_mappings_url }
      format.json { head :no_content }
    end
  end
end
