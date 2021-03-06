class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :register, :register_user]#como podemos ver aqui el metodo set_event va a funcionar con los siguientes metodos. before action son las cosas que van a ser al cargarse los metodos tales ejecuuta de inmediato el metodo set_event.
  before_action :is_event_full?, only: :register_user
  before_action :is_valid_email?, only: :register_user
  before_action :set_user, only: :register_user

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  
  

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, flash: {success: 'Event was successfully destroyed.' }}
      format.json { head :no_content }
    end
  end
  message=''
  def register
    #@event=Event.find(params[:id])##params se agarra del url.
    #tambien podemos usar set_event
    #set_event
    #tambien lo podemos agregar arriba como comando que se puedee hacer en la parte de arriba
    @users_of_event = @event.users #esto es lo que necesita al final para funcionen las rutas y con sus metodos.

  end
  def register_user
    @event = Event.find(params[:id])
    
      if @user.nil? || @event.users.include?(@user) #se agrega si es que no es nil
        
        redirect_to register_to_event_path(@event), flash: {danger: 'Could not register'}
        return
      end
    @event.users << @user #asi es como agregaos
    redirect_to register_to_event_path(@event)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
      
    end
    #agregamos
    def set_user
      email = params[:email]
      @user = User.where(email: email).take
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :start_date, :end_date, :max_students, :description)
    end
    #agregamos esto: verificamos si esta llena el evento

  #agregamos nuestros metodos para ver si esta el evento
  def is_event_full?
    if @event.is_event_full?
      redirect_to register_to_event_path(@event), flash: {danger: "The event #{@event.name} is full so take a hike."} 
    end
  end
  #agregamos este metodo
  def is_valid_email?
    if params[:email].blank? || params[:email] !~ User::VALID_EMAIL_REGEX
      redirect_to register_to_event_path(@event), flash: {danger: "You must specify a correct email"}
    end
  end
end

