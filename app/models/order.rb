class Order < ActiveRecord::Base
  has_many :line_items
  has_many :email_recipients
  belongs_to :user

  def total_price
    # convert to array so it doesn't try to do sum on database directly
    line_items.to_a.sum(&:full_price)
  end
end
