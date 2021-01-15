module ItemsHelper
  def ordered?(orders, item_id)
    orders.each do |order|
      return true if order[:item_id] == item_id
    end
    false
  end
end
