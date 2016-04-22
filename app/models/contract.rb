class Contract < ActiveRecord::Base
  serialize :teammates_ids
  belongs_to :user

  def coders
    Coder.find(teammates_ids)
  end

  def total_cost
    cost = coders.reduce(0) do |sum, coder|
      sum = sum + coder.cost.to_f
    end
    sprintf("%.2f", cost)
  end

  def formatted_date(date_time)
    created_at.strftime("%B %d, %Y - %H:%M UTC")
  end

  def completed?
    status == "Completed"
  end

  def cancelled?
    status == "Cancelled"
  end
end
