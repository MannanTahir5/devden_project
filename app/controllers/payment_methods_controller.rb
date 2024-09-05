class PaymentMethodsController < ApplicationController
  before_action :set_order

  def new
    @payment = @order.build_payment_method
  end

  def create
    @payment = @order.build_payment_method(payment_params)

    if @payment.save
      @order.update!(status: :complete)
      redirect_to order_path(@order), notice: 'Order completed successfully.'
    else
      render :new
    end
  end

  private
    def set_order
      @order = Order.find(params[:order_id])
    end

    def payment_params
      params.require(:payment_method).permit(:name, :details)
    end
end