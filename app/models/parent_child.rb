class ParentChild < ApplicationRecord
    belongs_to :child, class_name: 'Claim'
    belongs_to :parent, class_name: 'Claim'
end
