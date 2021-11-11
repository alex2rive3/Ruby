class ProyectosController < ApplicationController
  before_action :set_proyecto, only: %i[ show edit update destroy ]

  # GET /proyectos or /proyectos.json
  def index
    @proyectos = Proyecto.all
  end

  # GET /proyectos/1 or /proyectos/1.json
  def show
  end

  # GET /proyectos/new
  def new
    @proyecto = Proyecto.new
  end

  # GET /proyectos/1/edit
  def edit
  end

  # POST /proyectos or /proyectos.json
  def create
    @proyecto = Proyecto.new(proyecto_params)

    respond_to do |format|
      if @post.save
        PostMailer.with(user: current_user, post: @post).post_created.deliver_later
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proyectos/1 or /proyectos/1.json
  def update
    respond_to do |format|
      if @proyecto.update(proyecto_params)
        format.html { redirect_to @proyecto, notice: "Proyecto was successfully updated." }
        format.json { render :show, status: :ok, location: @proyecto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proyectos/1 or /proyectos/1.json
  def destroy
    @proyecto.destroy
    respond_to do |format|
      format.html { redirect_to proyectos_url, notice: "Proyecto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyecto
      @proyecto = Proyecto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def proyecto_params
      params.require(:proyecto).permit(:title, :content)
    end
end
