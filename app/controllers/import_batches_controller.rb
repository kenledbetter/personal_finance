class ImportBatchesController < ApplicationController
  # GET /import_batches
  # GET /import_batches.json
  def index
    @import_batches = ImportBatch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @import_batches }
    end
  end

  # GET /import_batches/1
  # GET /import_batches/1.json
  def show
    @import_batch = ImportBatch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @import_batch }
    end
  end

  # GET /import_batches/new
  # GET /import_batches/new.json
  def new
    @import_batch = ImportBatch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @import_batch }
    end
  end

  # GET /import_batches/1/edit
  def edit
    @import_batch = ImportBatch.find(params[:id])
  end

  # POST /import_batches
  # POST /import_batches.json
  def create
    @import_batch = ImportBatch.new(params[:import_batch])

    respond_to do |format|
      if @import_batch.save
        format.html { redirect_to @import_batch, notice: 'Import batch was successfully created.' }
        format.json { render json: @import_batch, status: :created, location: @import_batch }
      else
        format.html { render action: "new" }
        format.json { render json: @import_batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /import_batches/1
  # PUT /import_batches/1.json
  def update
    @import_batch = ImportBatch.find(params[:id])

    respond_to do |format|
      if @import_batch.update_attributes(params[:import_batch])
        format.html { redirect_to @import_batch, notice: 'Import batch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @import_batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /import_batches/1
  # DELETE /import_batches/1.json
  def destroy
    @import_batch = ImportBatch.find(params[:id])
    @import_batch.destroy

    respond_to do |format|
      format.html { redirect_to import_batches_url }
      format.json { head :no_content }
    end
  end
end
