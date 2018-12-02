class TestDataWriter
  include FactoryBot::Syntax::Methods

  def initialize(attrs, key: nil)
    @attrs = key.nil? ? {} : attrs.dup
    @key = key
    @row = nil
    @children = []

    children = key.nil? ? attrs : @attrs.delete(:children)
    return if children.nil?

    children.each do |child_key, child_data|
      child_data.each do |child_attrs|
        @children.push(TestDataWriter.new(child_attrs, key: child_key))
      end
    end
  end

  def to_s
    hash = { key: @key, attrs: @attrs }
    hash.to_s
  end

  def id_hash
    @key.nil? ? {} : { "#{@key}_id".to_sym => @row.to_param }
  end

  def execute(parent: nil)
    inherit_attrs = parent.nil? ? {} : parent.id_hash
    @row = create(@key, @attrs.merge(inherit_attrs)) if !@key.nil?

    @children.each do |writer|
      writer.execute(parent: self)
    end
  end

end
