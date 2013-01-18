class FinalNamesController < ApplicationController
  # GET /final_names
  # GET /final_names.json
  def index
    @final_names = FinalName.all(:include => :category)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @final_names }
    end
  end

  # GET /final_names/1
  # GET /final_names/1.json
  def show
    @final_name = FinalName.find(params[:id])
    @entries = @final_name.entries.includes(:final_name, :category)

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

    # If desired name conflicts with existing final_name, return an error
    if (@final_name.name != params[:final_name][:name] &&
        FinalName.find_by_name(params[:final_name][:name]))
      respond_to do |format|
        format.html { redirect_to @final_name,
          notice: 'Desired final_name already exists. ' +
          'Use merge feature below to merge with existing final_name.' }
        format.json { head :no_content }
      end
    else
      # Update entry categories if desired
      if (params[:merge_category])
        category = Category.find(params[:final_name][:category_id])

        @final_name.entries.each do |entry|
          entry.category = category
          entry.save
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
  end

  # PUT /final_names/1/merge
  # PUT /final_names/1/merge.json
  def merge
    @final_name = FinalName.find(params[:id])

    # Try to merge with target final_name
    if (params[:merge_id] &&
        merge_name = FinalName.find(params[:merge_id]))

      @final_name = @final_name.merge_with(
        merge_name, params[:merge_category] ? true : false)

      respond_to do |format|
        format.html { redirect_to @final_name, notice: 'Final name was successfully merged.' }
        format.json { head :no_content }
      end
    else

      respond_to do |format|
        format.html { redirect_to @final_name, notice: 'Final name merge failed.' }
        format.json { head :no_content }
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
