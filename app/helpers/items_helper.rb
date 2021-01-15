module ItemsHelper

  def ordered?(orders, item_id)
    orders.each do |order|
      if order[:item_id] == item_id
        return true
      end
    end   
    return false
  end

end
