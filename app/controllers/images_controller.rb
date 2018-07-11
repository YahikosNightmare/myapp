class ImagesController < ApplicationController

	before_action :set_image, only: [:show, :edit, :update, :destroy]
=begin
	Damos permisos para la captura de los parametros de nuestro formulario
=end
	
	## si se declara privado todo desde aquí, hasta que no se haga una declaración diferente de visibilidad (public, protected) todos los métodos serán accesibles solo dentro del controlador
	private
	
    def images_params
		params.require(:image).permit :description, :picture
	end

    def set_image
		@image = Image.find params[:id]
	end

	##SE CAMBIA LA VISIBILIDAD DE AQUÍ EN ADELANTE A PUBLICA
    public

=begin
	Creaciòn de una nueva instancia de la imagen
=end
	def new 
		@image = Image.new
	end


	def create 
		#render plain: params[:image].inspect
        @image = Image.new images_params
        @image.save

        redirect_to @image  #redirecciona a una nueva vista
    end

=begin
	Creamos nuestro metodo show para visualizar nuestro objeto imagen
=end
    def show
    	
    end

=begin
	Creamos nuestro metodo index en el controlador para visualizar todos los objetos creados. 
=end
    def index
        @images = Image.all            # variable de tipo array @images
   	end

	def edit
		
	end

	def update
		
		@image.update images_params
		redirect_to @image
	end

	def destroy
		
		@image.destroy
		redirect_to images_path
	end

end
