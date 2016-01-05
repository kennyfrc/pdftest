class EmailRecipientsController < ApplicationController
  before_action :set_email_recipient, only: [:show, :edit, :update, :destroy]

  # GET /email_recipients
  # GET /email_recipients.json
  def index
    @email_recipients = EmailRecipient.all
  end

  # GET /email_recipients/1
  # GET /email_recipients/1.json
  def show
  end

  # GET /email_recipients/new
  def new
    @email_recipient = EmailRecipient.new
  end

  # GET /email_recipients/1/edit
  def edit
  end

  # POST /email_recipients
  # POST /email_recipients.json
  def create
    @order = Order.find(params[:order_id]) # how to use current object?
    @email_recipient = EmailRecipient.new(email_recipient_params)
    @user = current_user

    respond_to do |format|
      if @email_recipient.save
        pdf = OrderPdf.new(@order, view_context) # initialize the OrderPdf class # pass an argument as this is required in the class that you've made
        pdf.render_file File.join(Rails.root, "tmp", "x.pdf")
        current_user.certificate = File.open("#{Rails.root}/tmp/x.pdf")
        current_user.save!
        PdfMailer.email_pdf(@email_recipient, @user).deliver

        format.html { redirect_to order_email_recipient_path(@order, @email_recipient), notice: "Successfully sent" }
        format.json { render :show, status: :created, location: @email_recipient }
      else
        format.html { render :new }
        format.json { render json: @email_recipient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_recipients/1
  # PATCH/PUT /email_recipients/1.json
  def update
    respond_to do |format|
      if @email_recipient.update(email_recipient_params)
        format.html { redirect_to order_email_recipient_path(@order, @email_recipient), notice: 'Email recipient was successfully updated.' }
        format.json { render :show, status: :ok, location: @email_recipient }
      else
        format.html { render :edit }
        format.json { render json: @email_recipient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_recipients/1
  # DELETE /email_recipients/1.json
  def destroy
    @email_recipient.destroy
    respond_to do |format|
      format.html { redirect_to email_recipients_url, notice: 'Email recipient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_recipient
      @email_recipient = EmailRecipient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_recipient_params
      params.require(:email_recipient).permit(:email, :subject, :content, :user_id)
    end
end
