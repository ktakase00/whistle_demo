module AppUtil
  def self.load_config(file_name: 'whistle_demo')
    file_path = Rails.root.join('config', "#{file_name}.yml")
    values = YAML.load_file(file_path)
    values[Rails.env.to_s].deep_symbolize_keys
  end

  def self.get_now
    Time.now
  end
end
