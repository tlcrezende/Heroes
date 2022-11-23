class Hero < ApplicationRecord
    
    validates :name, :token, presence: true
    scope :organizar_por_nome, -> { order(:name) }
    scope :search, ->(term) { where('LOWER(name) LIKE ?', "%#{term.downcase}%") if term.present? }
    scope :by_token, -> (token) {where(token: token)}
end
