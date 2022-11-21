class Author < ApplicationRecord
    has_many :books, :dependent => :destroy

    validates :last_name, presence: true
    validates :biography, presence: true, length: { minimum: 10 }

end
