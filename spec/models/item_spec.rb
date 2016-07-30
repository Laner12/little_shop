require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should belong_to :celebrity }
  it { should belong_to :category }
  it { should have_many :order_items }
  it { should have_many(:orders).through(:order_items) }
  it { should validate_uniqueness_of(:title).scoped_to(:celebrity_id) }
  it { should validate_presence_of :price }
  it { should validate_presence_of :title }
  it { should have_db_column(:status).with_options(default: 'available') }

  it "should give celebrity name" do
    item = create(:item)
    expect(item.celebrity.name).to eq(item.celebrity_name)
  end

  it "should return tell if an item is sold out" do
    item = create(:sold_out_item)
    expect(item.sold_out?).to eq(true)
  end
end
