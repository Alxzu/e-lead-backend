@settings.each do |setting|
  value = Setting.get(setting.key)
  json.set! setting.key, value
end
