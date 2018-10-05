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
      
     if @status == "pending" && self.sender.balance >= amount
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
      
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
     end

  else
     @status = "rejected"
    return "Transaction rejected. Please check your account balance."
  end
    
  end
  
  
  
  
end
