class Author < ApplicationRecord

    validates :last_name, presence: true
    validates :biography, presence: true, length: { minimum: 10 }

end
