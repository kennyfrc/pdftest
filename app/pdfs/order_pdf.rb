class OrderPdf < Prawn::Document
  def initialize(order, view)
    super(top_margin: 70)
          # Ruby's super method lets us call a method in the parent class from within the child class.
          # we can also pass some stuff here as much as we pass stuff to Prawn::Document like top_margin
    @order = order # because this is a new class, we don't have access to the instance variable.. so we need to pass it pa
    @view = view
    order_number
    line_items
    total_price
  end

  def order_number
    text "Order \##{@order.order_number}", size: 30, style: :bold 
  end

  def line_items
    move_down 20 # will be shown 20 lines below the order number
    table line_item_rows
  end

  def line_item_rows
    [["Product", "Qty", "Unit Price", "Full Price"]] +
    @order.line_items.map do |item|
      [item.name, item.quantity, price(item.unit_price), price(item.full_price)]
    end # creates a 2-dimensional array (ie. each array forms a row)
  end

  def price(num)
    @view.number_to_currency(num)
  end

  def total_price
    move_down 15
    text "Total Price: #{price(@order.total_price)}", size: 16, style: :bold
  end
end