class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def admin_list
    @lists = List.all
  end

  def detalle
      if !user_signed_in?
        redirect_to user_session_path
      end
      @userlistos  = UserList.where(list_id: params[:list_id], estatus: 1) #true

      @five = UserList.where(list_id: params[:list_id],estatus: :true).order(created_at: :desc).limit(5)


  end


def listo
  if !user_signed_in?
    redirect_to user_session_path
  else
    userlist = UserList.where(user_id:current_user.id,list_id:params[:list_id])
    if userlist.count > 0
      # Lo encontro Actualizo
     UserList.where(user_id: current_user.id, list_id:params[:list_id]).update(estatus:params[:estatus])
    else
      # creo
      UserList.create(user_id: current_user.id, list_id:params[:list_id], estatus: params[:estatus])
    end
    redirect_to root_path
end

end

  # GET /lists
  # GET /lists.json
  def index
    @lists = List.all

  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)
    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:nombre, :titulo, :detalle, :url, :remote_url_url, :url_cache)
    end
end
