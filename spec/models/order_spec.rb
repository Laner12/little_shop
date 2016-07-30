require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to :user }
  it { should have_many(:items).through(:order_items) }
  it { should have_many :order_items }

  it "should default to ordered status" do
    order = create(:order)
    expect(order.status).to eq("ordered")
  end
end
