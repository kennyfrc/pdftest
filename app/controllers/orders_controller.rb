class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do # send back the data for teh pdf docment
        pdf = OrderPdf.new(@order, view_context) # initialize the OrderPdf class # pass an argument as this is required in the class that you've made
        send_data pdf.render, filename: "order_#{@order.order_number}.pdf", # pass the filename argument as well to indicate the filename
                              type: "application/pdf", # set this, otherwise it deafults to an application/octet-stream (it means that it's a binary file that needs to be opened in some application, such as a spreadsheet or word processor)
                              disposition: "inline" # just do it inline without downloading it
      pdf_path = Rails.root.join('tmp', "order_#{@order.order_number}.pdf")
      puts "this is the value of pdf_path: #{pdf_path}"
      puts "this is the value of pdf: #{pdf}"

      end
    end
  end
end
