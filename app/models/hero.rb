class Hero < ApplicationRecord
    
    validates :name, :token, presence: true
    validates :name, uniqueness: {scope: :token, case_sensitive: false}
    scope :organizar_por_nome, -> { order(:name) }
    scope :search, ->(term) { where('LOWER(name) LIKE ?', "%#{term.downcase}%") if term.present? }
    scope :by_token, -> (token) {where(token: token)}
end
