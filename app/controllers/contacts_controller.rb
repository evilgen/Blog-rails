class ContactsController < ApplicationController
  def new
    
  end

  def create
    @contact = Contact.new(contacts_params)
    @contact.save 
  end

  private

#явно разрешаем использование параметров формы (сделано в целях защиты из вне)
  def contacts_params
    params.require(:contact).permit(:email, :message)
  end

end
