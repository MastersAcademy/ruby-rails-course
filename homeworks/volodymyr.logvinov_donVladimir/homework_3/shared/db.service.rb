class DB

  def initialize
    @memstore = Hash.new

    self
  end

  def connect(name)
    puts "connected to ", name
  end

  def get(table_name, index)
    @memstore.has_key?(table_name) ? @memstore[table_name][index] : nil
  end

  def get_all(table_name)
    @memstore.has_key?(table_name) ? @memstore[table_name] : []
  end

  def post(table_name, data)
    !@memstore.has_key?(table_name) ? @memstore[table_name] = [] : nil
    @memstore[table_name].push(data)
  end

  def update(table_name, index, data)
    @memstore[table_name][index] = data
  end

  def delete(table_name, index)
    @memstore[table_name].delete_at(index)
  end

end
