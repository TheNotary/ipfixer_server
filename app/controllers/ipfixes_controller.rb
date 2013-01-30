class IpfixesController < ApplicationController
  # GET /ipfixes
  # GET /ipfixes.json
  def index
    @ipfixes = Ipfix.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ipfixes }
    end
  end

  # GET /ipfixes/1
  # GET /ipfixes/1.json
  def show
    @ipfix = Ipfix.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ipfix }
    end
  end

  # GET /ipfixes/new
  # GET /ipfixes/new.json
  def new
    @ipfix = Ipfix.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ipfix }
    end
  end

  # GET /ipfixes/1/edit
  def edit
    @ipfix = Ipfix.find(params[:id])
  end

  # POST /ipfixes
  # POST /ipfixes.json
  def create
		attributes = params[:ipfix].reject {|k| k == 'security_token'}
    @ipfix = Ipfix.new(attributes)
		security_token = params[:ipfix]['security_token']
		leave if security_token != 'TOKEN'

    if !Ipfix.where(:host => @ipfix.host).empty? # if already exists
      @ipfix = Ipfix.where(:host => @ipfix.host).first
			@ipfix.assign_attributes(attributes)
		end

    respond_to do |format|
      if @ipfix.save
        format.html { redirect_to @ipfix, notice: 'Ipfix was successfully created.' }
        format.json { render json: @ipfix, status: :created, location: @ipfix }
      else
        format.html { render action: "new" }
        format.json { render json: @ipfix.errors, status: :unprocessable_entity }
      end
    end
  end

  def leave
    puts "I'm a stub!"
  end

  # PUT /ipfixes/1
  # PUT /ipfixes/1.json
  def update
    @ipfix = Ipfix.find(params[:id])

    respond_to do |format|
      if @ipfix.update_attributes(params[:ipfix])
        format.html { redirect_to @ipfix, notice: 'Ipfix was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ipfix.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ipfixes/1
  # DELETE /ipfixes/1.json
  def destroy
    @ipfix = Ipfix.find(params[:id])
    @ipfix.destroy

    respond_to do |format|
      format.html { redirect_to ipfixes_url }
      format.json { head :no_content }
    end
  end
end
