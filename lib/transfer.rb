class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid? && @status != "complete" && @sender.balance >= @amount
  end

  def execute_transaction
    if self.valid?
      @status = "complete"
      sender.balance -= @amount
      receiver.balance += @amount
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" || @status == "reversed"
      sender.balance += @amount
      receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
