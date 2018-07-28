class Order < ApplicationRecord

  enum status: %i(pending prepare shipped)
end
