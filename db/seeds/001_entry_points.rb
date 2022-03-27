# 4 Entry points
1.upto(4).each do |entry_point_number|
  entry_point_name = "Entry Point #{entry_point_number}"
  EntryPoint.find_or_create_by(name: entry_point_name)
end
