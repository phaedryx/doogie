class EntriesController < ApplicationController
  respond_to :html, :json
  
  def index
    @entries = Entry.all
    respond_with(@entries)
  end

  def show
    @entry = Entry.find(params[:id])
    respond_with(@entry)
  end

  def new
    @entry = Entry.new
    respond_with(@entry)
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = Entry.new(params[:entry])

    if @entry.save
      respond_with(@entry, status: :created, location: @entry)
    else
      respond_with(@entry.errors, status: :unprocessable_entity)
    end
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update_attributes(params[:entry])
      head :ok
    else
      respond_with(@entry.errors, status: :unprocessable_entity)
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    head :ok
  end
end
