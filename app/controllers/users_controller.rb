class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show]

  def index
    @users = User.all
    respond_to do |format|
      format.json do
        render json: @users
      end

      format.html
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
    respond_to do |format|
      format.json do
        render json: @user
      end
      format.html
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      format.json do
        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      format.html do
        if @user.save
          redirect_to user_path(@user), notice: 'User was successfully created.'
        else
          render :new
        end
      end
    end
  end

  def filter
    campaign_names = params[:campaign_names].gsub(/\s+/, "").split(',')
    @users = User.where("JSON_CONTAINS(campaigns_list->'$[*].campaign_name', ?)", campaign_names.to_json)
    render json: @users
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, campaigns_list: [:campaign_name, :campaign_id])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
