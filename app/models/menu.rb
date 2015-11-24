class Menu < ActiveRecord::Base
  scope :header, -> { where state: 0 }
  scope :right, -> { where state: 1 }
  TYPES = {
      :header => 0,
      :right => 1
  }
  has_ancestry
end
