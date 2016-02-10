class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  before_save :generate_open_id!

  validates :first_name, presence: true, on: :create
  validates :first_name, length: { in: 1..128 }
  validates :last_name, presence: true, on: :create
  validates :last_name, length: { in: 1..128 }

  private

  def generate_open_id!
    begin
      self.open_id = Devise.friendly_token
    end while self.class.exists?(open_id: open_id)
  end


end
