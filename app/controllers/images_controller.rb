class ImagesController < ApplicationController

=begin
	Damos permisos para la captura de los parametros de nuestro formulario
=end
	
	private
	
    def images_params
        params.require(:image).permit(:description)
    end 

    
    public

=begin
	Creaciòn de una nueva instancia de la imagen
=end
	def new 
		@image = Image.new
	end


	def create 
		render plain: params[:image].inspect
        @image = Image.new images_params
        @image.save

        redirect_to @image  #redirecciona a una nueva vista
    end

=begin
	Creamos nuestro metodo show para visualizar nuestro objeto imagen
=end
    def show
    	@image = Image.find params[:id]
    end

=begin
	Creamos nuestro metodo index en el controlador para visualizar todos los objetos creados. 
=end
    def index
        @images = Image.all            # variable de tipo array @images
   	end

	def edit
		@image = Image.find params[:id]
	end

end
