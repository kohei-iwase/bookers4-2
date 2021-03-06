class UsersController < ApplicationController
	before_action :baria_user, only: [:update, :edit]

  def show
  	@user = User.find(params[:id])
  	@books = @user.books.reverse_order
  	@book = Book.new 
    #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
  end

  def index
#    @user = @user||current_user
  	@users = User.all #一覧表示するためにUserモデルのデータを全て変数に入れて取り出す。
  	@book = Book.new #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
  end

  def edit
  	@user = User.find(params[:id])
     if @user != current_user
    redirect_to "/users/2"
    end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to "/users/2", notice: "successfully updated user!"
  	else
  		render :edit,notice: "update error"
  	end
  end

  def following
    @title = "Following"
    @book = Book.new #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
    @user   = User.find(params[:id])
    @users  = @user.following#.paginate(page: params[:page])
    render "show_follow"
  end

  def followers
    @title = "Followers"
    @book = Book.new #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
    @user   = User.find(params[:id])
    @users  = @user.followers#.paginate(page: params[:page])
    render "show_follow"
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image,:postcode, :prefecture_name, :address_city, :address_street, :address_building)
  end

 # url直接防止　メソッドを自己定義してbefore_actionで発動。
   def baria_user
	   unless params[:id].to_i == current_user.id
  		redirect_to user_path(current_user)
  	end
   end

end
