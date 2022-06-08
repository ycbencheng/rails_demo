class TransactionController < ApplicationController
  def index
    @buyer_transactions = current_user.buyer_transactions
    @seller_transactions = current_user.seller_transactions
  end

  def create
    widget = Widget.find(widget_params[:id])
    widget_to_transaction = Transaction.widget_to_transaction(widget, current_user)
    transaction = Transaction.new(widget_to_transaction)

    not_user_widget = widget.seller_id != current_user.id

    if not_user_widget && transaction.save
      flash[:notice] = "Purchase successful!"

      redirect_to transactions_path
    else
      msg = not_user_widget ? "Please try again!" : "Can not purchase your own widget!"
      flash[:alert] = msg

      redirect_to root_path
    end
  end

  private

  def widget_params
    params.require(:widget).permit(:id)
  end
end
