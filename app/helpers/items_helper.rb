module ItemsHelper
  def item_celebrities
    Celebrity.all.map { |celebrity| [celebrity.name, celebrity.id] }
  end

  def item_categories
    Category.all.map { |category| [category.title, category.id] }
  end
end
