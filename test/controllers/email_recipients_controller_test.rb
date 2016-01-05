require 'test_helper'

class EmailRecipientsControllerTest < ActionController::TestCase
  setup do
    @email_recipient = email_recipients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:email_recipients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create email_recipient" do
    assert_difference('EmailRecipient.count') do
      post :create, email_recipient: { content: @email_recipient.content, email: @email_recipient.email, order_id: @email_recipient.order_id, subject: @email_recipient.subject }
    end

    assert_redirected_to email_recipient_path(assigns(:email_recipient))
  end

  test "should show email_recipient" do
    get :show, id: @email_recipient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @email_recipient
    assert_response :success
  end

  test "should update email_recipient" do
    patch :update, id: @email_recipient, email_recipient: { content: @email_recipient.content, email: @email_recipient.email, order_id: @email_recipient.order_id, subject: @email_recipient.subject }
    assert_redirected_to email_recipient_path(assigns(:email_recipient))
  end

  test "should destroy email_recipient" do
    assert_difference('EmailRecipient.count', -1) do
      delete :destroy, id: @email_recipient
    end

    assert_redirected_to email_recipients_path
  end
end
