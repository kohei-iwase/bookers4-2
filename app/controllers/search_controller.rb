class SearchController < ApplicationController
  

  def index
    @user = current_user
  	@users = User.all #検索結果を表示するためにUserモデルのデータを全て変数に入れて取り出す。
  	@books = Book.all #検索結果を表示するためにUserモデルのデータを全て変数に入れて取り出す。
  	@book = Book.new #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
  end


  private
  
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
    def book_params
  	params.require(:book).permit(:title, :body)
  end

 end