class Admin::UsersController < Admin::BaseController
  before_filter :get_user, only: [:show, :edit, :update, :destroy]

  def index
    @search = User.search(params[:search])
    @users = @search.paginate(page: params[:page])
  end

  def show

  end

  def new
    @user = User.new
  end

  def edit

  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to [:admin,@user], notice: t('users.create.notice')
    else
      flash[:alert] = t('users.create.alert')
      render 'new'
    end
  end

  def update
    email_changed = @user.email != params[:user][:email]
    password_changed = !params[:user][:password].empty?

    successfully_updated = if email_changed or password_changed
                             @user.update_with_password(params[:user])
                           else
                             @user.update_without_password(params[:user])
                           end

    if successfully_updated
      redirect_to [:admin,@user], notice: t('users.update.notice')
    else
      flash[:alert] = t('users.update.alert')
      render 'edit'
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path, notice: t('users.destroy.notice')
    else

    end
  end

  private
  def get_user
    @user = User.find(params[:id])
  end

end
