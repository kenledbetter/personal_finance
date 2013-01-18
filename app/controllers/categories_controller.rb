class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.find(params[:id])
    @entries = @category.entries

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  # GET /categories/monthly
  # POST /categories/monthly
  def monthly
    if (params[:date] != nil && params[:date][:year] != nil)
      year = params[:date][:year].to_i
    else
      year = Date.today.year
    end

    month = 1
    @months = []
    @date = Date.civil(year, 1, 1)

    (0...12).each do |i|
      startDay = Date.civil(year, month, 1)
      endDay = Date.civil(year, month, -1)

      totals = {}

      Entry.where(:date => startDay..endDay).each do |entry|
        if (!entry.final_name.category.ignore)
          if (totals[entry.final_name.category.name] == nil)
            totals[entry.final_name.category.name] = {:debits => 0, :credits => 0}
          end
    
          if (entry.amount > 0)
            totals[entry.final_name.category.name][:debits] += entry.amount
          else
            totals[entry.final_name.category.name][:credits] += entry.amount
          end
        end
      end

      @months.push(totals)
      month += 1
    end
  end

  # GET /categories/yearly
  # POST /categories/yearly
  def yearly
    if (params[:date] != nil && params[:date][:year] != nil)
      year = params[:date][:year].to_i
    else
      year = Date.today.year
    end

    @date = Date.civil(year, 1, 1)

    startDay = Date.civil(year, 1, 1)
    endDay = Date.civil(year, 12, -1)

    @totals = {}

    Entry.where(:date => startDay..endDay).each do |entry|
      if (!entry.final_name.category.ignore)
        if (@totals[entry.final_name.category.name] == nil)
          @totals[entry.final_name.category.name] =
            {:category => entry.final_name.category, :debits => 0, :credits => 0}
        end
  
        if (entry.amount > 0)
          @totals[entry.final_name.category.name][:credits] += entry.amount
        else
          @totals[entry.final_name.category.name][:debits] += entry.amount
        end
      end
    end
  end
end
