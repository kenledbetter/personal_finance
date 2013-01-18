require 'csv'

class EntriesController < ApplicationController
  # GET /entries
  # GET /entries.json
  def index
    year = Date.today.year
    month = Date.today.month

    startDay = Date.civil(year, month, 1)
    endDay = Date.civil(year, month, -1)

    @entries = Entry.where(:date => startDay..endDay)
    @date = startDay

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entries }
    end
  end

  # POST /entries/search
  def search
    if (params[:date] != nil && params[:date][:month] != nil && params[:date][:year] != nil)
      year = params[:date][:year].to_i
      month = params[:date][:month].to_i
    else
      year = Date.today.year
      month = Date.today.month
    end

    startDay = Date.civil(year, month, 1)
    endDay = Date.civil(year, month, -1)

    @entries = Entry.where(:date => startDay..endDay)
    @date = startDay

    render "index"
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    @entry = Entry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/new
  # GET /entries/new.json
  def new
    @entry = Entry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    @entry = Entry.find(params[:id])
    @finalName = ""
    @finalNameAuto = false

    if (@entry.final_name != nil)
      @finalName = @entry.final_name.name
    end

    rtfnMapping = RawToFinalNameMapping.find_by_name_and_account_id(
      @entry.raw_name, @entry.account_id)
    
    if (rtfnMapping != nil && @entry.final_name != nil &&
        rtfnMapping.final_name == @entry.final_name)
      @finalNameAuto = true
    end
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(params[:entry])

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render json: @entry, status: :created, location: @entry }
      else
        format.html { render action: "new" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.json
  def update
    @entry = Entry.find(params[:id])

    # If final_name has changed, find or create it and assign it
    if (params[:final_name] && params[:final_name] != @entry.final_name.try(:name) &&
        final_name = FinalName.find_or_create_by_name(params[:final_name]))
      old_final_name = @entry.final_name
      @entry.final_name = final_name
      @entry.save

      # Delete orphaned final_names and mappings
      if (old_final_name != nil && old_final_name.entries.length == 0)
        old_final_name.raw_to_final_name_mappings.each do |rtfnMapping|
          rtfnMapping.destroy
        end

        old_final_name.destroy
      end
    end

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to entries_url }
      format.json { head :no_content }
    end
  end

  # GET /entries/import
  # POST /entries/import
  def import
    @imported = false

    if (!params[:attachment].blank?)
      flash.now[:notice] = "File uploaded"

      import_batch = ImportBatch.create

      CSV.parse(params[:attachment].read).each do |row|
        entry = Entry.new(
          :date => Date.strptime(row[0], '%m/%d/%Y'),
          :raw_name => row[2],
          :amount => row[7],
          :account_id => params[:account_id],
          :import_batch_id => import_batch.id)
        entry.save
      end
    end
  end

  # GET /entries/1/match
  # GET /entries/match
  def match
    if (params[:id] == nil)
      @entries = Entry.where(:final_name_id => nil)
    else
      @entries = [Entry.find(params[:id])]
    end

    @entries.each do |entry|
    # Search for mapping that matches raw name
      rtfnMapping = RawToFinalNameMapping.find_by_name_and_account_id(
        entry.raw_name,  entry.account_id)
  
      if (rtfnMapping != nil)
        entry.final_name = rtfnMapping.final_name
        entry.category = rtfnMapping.final_name.category
        entry.save
      end
    end

    respond_to do |format|
      format.html { redirect_to :action => 'index' }
    end
  end
end
