class Admin::ContactsController < Admin::BaseController

  def index
    @search = Contact.search(params[:search])
    @contacts = @search.paginate(page: params[:page])
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def destroy
    @contact = Contact.find(params[:id])
    if @contact.destroy
      redirect_to admin_contacts_path, notice: t("flash.admin.contacts.destroy.notice")
    else
      redirect_to admin_contacts_path, alert: t("flash.admin.contactes.destroy.alert")
    end
  end
end