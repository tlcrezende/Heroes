class Hero < ApplicationRecord
    
    validates :name, presence: true
    scope :organizar_por_nome, -> { order(:name) }
    scope :search, ->(term) { where('LOWER(name) LIKE ?', "%#{term.downcase}%") if term.present? }
end
