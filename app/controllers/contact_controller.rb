class ContactController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      Notifier.contact(@contact).deliver
      redirect_to root_path, notice: t("flash.contact.create.notice")
    else
      flash.now[:alert] = t("flash.contact.create.alert")
      render "new"
    end
  end
end
