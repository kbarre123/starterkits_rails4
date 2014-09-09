class ContactsController < ApplicationController
    load_and_authorize_resource

    def new
        @contact = Contact.new
        @user = current_user
    end

    def create
        @contact = Contact.new(contact_params)
        @user = current_user

        if @contact.valid?
            NotificationsMailer.new_contact(@contact).deliver
            redirect_to(root_path, :notice => "Message was successfully sent.")
        else
            flash.now.alert = "Please fill all fields."
            render :new
        end
    end

    private

    def contact_params
        params.require(:contact).permit( :name, :email, :subject ,:body )
    end

end
