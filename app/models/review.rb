class Review < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_many :responses, dependent: :destroy

  validates :title, :content, :rating, presence: { message: "Campo obrigatório" }
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: (0..5).to_a }
end
