class Transfer
  attr_accessor :sender, :receiver, :amount , :status
  
  
  def initialize(sender , receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    
  end
  
  def valid?
    receiver.valid? && sender.valid?
  end
  
  def execute_transaction
    if @sender.valid?
    if @status == "pending"
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    end
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  else
    
  end
    
  end
  
  
  
  
end
