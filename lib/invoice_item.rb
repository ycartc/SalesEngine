class InvoiceItem
  attr_reader :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at, :repository

  def initialize(id, item_id, invoice_id, quantity, unit_price, created_at, updated_at, repository)
    @id = id.to_i
    @item_id = item_id.to_i
    @invoice_id = invoice_id.to_i
    @quantity = quantity.to_i
    @unit_price = unit_price.to_i
    @created_at = created_at
    @updated_at = updated_at
    @repository = repository
  end

  def invoice
    repository.find_invoice(invoice_id)
  end

  def item
    repository.find_item(item_id)
  end

  def revenue
    quantity.to_i * unit_price.to_i
  end

  def success?
    invoice.success?
  end

end
