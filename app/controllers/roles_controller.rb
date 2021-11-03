class RolesController < ApplicationController

  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
  end

  def show
    @role = Role.find(params[:id])
  end

  def edit
    @role = Role.find(params[:id])
  end

  def create
    role = Role.new(name: role_params[:name], permissions: {read: role_params[:read], write: role_params[:write], destroy: role_params[:destroy]})
    if role.save
      redirect_to notice: 'Role was successfully created.'
    else
      render :new
    end
  end

  def update
    @role = Role.find(params[:id])
    @role.update(name: role_params[:name], permissions: {read: role_params[:read], write: role_params[:write], destroy: role_params[:destroy]})
    if @role.save
      redirect_to @role, notice: 'Role was successfully updated.'
    else
       :edit
    end
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    redirect_to roles_url, notice: 'Role was successfully destroyed.'
  end

  private

  def role_params
    params.require(:role).permit(:name, :read, :write, :destroy)
  end
end
