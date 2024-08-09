class ApplicationsController < ApplicationController
    
    #Get All Apps...
    def index
        @applications = Application.all
        render json: @applications
    end

    #Find an application by Id
    def show
        @application = Application.find_by!(token: params[:token])
        render json: @application
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Application not found" }, status: :not_found
    end
      

    #Create new application
    def create
        @application = Application.new(application_params)
        if @application.save
            render json: { token: @application.token }, status: :created
        else
            render json: @application.errors,status: :unprocessable_entity
        end
    end


    #Update an existing application
    def update
        @application = Application.find_by!(token: params[:token])
        if @application.update(application_params)
            render json: @application
        else
            render json: @application.errors, status: :unprocessable_entity
        end
    end

    #Delete an application
    def destroy
        @application = Application.find_by!(token: params[:token])
        @application.destroy
        #head :no_content
        render json: { message: "Application deleted" }
    end

    private
    
    def application_params
        params.require(:application).permit(:name)
    end

end
