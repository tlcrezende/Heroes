class Hero < ApplicationRecord
    
    validates :name, presence: true
    scope :organizar_por_nome, -> { order(:name) }
end
