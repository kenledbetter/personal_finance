class FinalNamesController < ApplicationController
  # GET /final_names
  # GET /final_names.json
  def index
    @final_names = FinalName.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @final_names }
    end
  end

  # GET /final_names/1
  # GET /final_names/1.json
  def show
    @final_name = FinalName.find(params[:id])
    @entries = @final_name.entries

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @final_name }
    end
  end

  # GET /final_names/new
  # GET /final_names/new.json
  def new
    @final_name = FinalName.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @final_name }
    end
  end

  # GET /final_names/1/edit
  def edit
    @final_name = FinalName.find(params[:id])
  end

  # POST /final_names
  # POST /final_names.json
  def create
    @final_name = FinalName.new(params[:final_name])

    respond_to do |format|
      if @final_name.save
        format.html { redirect_to @final_name, notice: 'Final name was successfully created.' }
        format.json { render json: @final_name, status: :created, location: @final_name }
      else
        format.html { render action: "new" }
        format.json { render json: @final_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /final_names/1
  # PUT /final_names/1.json
  def update
    @final_name = FinalName.find(params[:id])

    # Try to combine with existing final_name if name was changed
    if (@final_name.name != params[:final_name][:name])
      final_name_match = FinalName.find_by_name(params[:final_name][:name])

      # If the match exists...
      if (final_name_match != nil)
        # Reassign all the entries to the match
        @final_name.entries.each do |entry|
          entry.final_name = final_name_match
          entry.save
        end

        # Reassign raw-to-final name mapping
        rtfn_mapping = RawToFinalNameMapping.find_by_final_name_id(@final_name.id)
        if (rtfn_mapping != nil)
          rtfn_mapping.final_name = final_name_match
          rtfn_mapping.save
        end

        # Delete the original entry
        @final_name.destroy

        # Reassign @final_name and complete the update
        @final_name = final_name_match
      end
    end

    respond_to do |format|
      if @final_name.update_attributes(params[:final_name])
        format.html { redirect_to @final_name, notice: 'Final name was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @final_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /final_names/1
  # DELETE /final_names/1.json
  def destroy
    @final_name = FinalName.find(params[:id])
    @final_name.destroy

    respond_to do |format|
      format.html { redirect_to final_names_url }
      format.json { head :no_content }
    end
  end
end
