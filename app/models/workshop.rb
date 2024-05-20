class Workshop < ApplicationRecord
  belongs_to :trainer, class_name: 'user'
end
