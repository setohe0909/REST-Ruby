class Api::V1::UsersController < ApplicationController
	# Ruby On Rails nos permite definir el modo de respuesta, en este caso estamos utilizando solo json,
	# pero si agregamos un :xml en la sentencia respond_to automáticamente tendremos nuestras respuestas
	# en formato XML, solo tendríamos que llamar al controlador con un .xml al final (GET /users.xml)
	respond_to :json
   
  	# GET /users.json
  	def index
	   @users = User.all
	   respond_with(@tournaments)
	end
 
  	# POST /users.json
	def create
	   @user = User.new(user_params)
	   if @user.save
	    respond_with({'status'=>'success'})
	   else
	    respond_with({'status'=>'error', 'errors'=> @user.errors})
	   end
	 end
   
  	# PATCH/PUT /users/1.json
  	def update
	   if @user.update(user_params)
	    respond_with({'status'=>'success'})
	   else
	    respond_with({'status'=>'error'})
	   end
  	end
 
  	# DELETE /users/1.json
  	def destroy
	   @user.destroy
	   respond_with({'status'=>'User deleted'})
  	end
 
  	def user_params
   		params.require(:user).permit(:name, :last_name, :phone)
  	end
end
