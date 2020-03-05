class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise 	:database_authenticatable, :registerable,
         	:recoverable, :rememberable, :trackable,:validatable

  has_many 	:books, dependent: :destroy
  has_many 	:book_comments, dependent: :destroy
  has_many 	:favorites, dependent: :destroy

  #フォロー関係
  has_many 	:active_relationships, 	class_name: "Relationship",
  									foreign_key:"follower_id",
  									dependent: 	:destroy
  has_many 	:passive_relationships, class_name: "Relationship",
  									foreign_key:"followed_id",
  									dependent: 	:destroy
  has_many	:following, through: :active_relationships, source: :followed
  has_many	:followers, through: :passive_relationships, source: :follower

  attachment :profile_image, destroy: false

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, presence:true ,length: {maximum: 20, minimum: 2}
  validates :introduction, length: {maximum: 50}

  #ユーザーをフォロー
  def follow(other_user)
  	active_relationships.create(followed_id: other_user.id)
  end

  #ユーザーをアンフォロー
  def unfollow(other_user)
  	active_relationships.find_by(followed_id: other_user.id).destroy
  end

  #現在のユーザーがーフォローしてたらtrue
  def following?(other_user)
  	following.include?(other_user)
  end
  
  private
  #検索対象をnameだけにする
    def self.ransackable_attributes(auth_object = nil)
     %w(name)
    end

end
