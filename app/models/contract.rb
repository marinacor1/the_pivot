class Contract < ActiveRecord::Base
  belongs_to :user
  has_many :teammates
  has_many :coders, through: :teammates

  scope :ordered, -> { all.order(id: :desc) }

  def set_teammates(coders)
    coders.each do |coder|
      teammates << Teammate.create(coder_id: coder.id, cost: coder.cost)
    end
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
