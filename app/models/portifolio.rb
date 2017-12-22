class Portifolio < ApplicationRecord
    validates_presence_of :title, :body, :main_image, :thumb_image

    scope :ruby_on_rails_portifolio_items, -> { where(subtitle: 'Ruby on Rails' )}
    scope :angular_portifolio_items, -> { where(subtitle: 'Angular' )}
end