def run_spec(file)
  unless File.exist?(file)
    puts "#{file} does not exist"
    return
  end

  puts "Running #{file}"
  system "bundle exec rspec #{file}"
  puts
end


#If any file ending in _spec.rb under the spec/ directory changes, run the run_spec method with its filename
watch("spec/.*/*_spec.rb") do |match|
  run_spec match[0]
end


#f any .rb file under the app/ directory changes, call the run_spec method with an equivalently named _spec.rb file under spec
watch("app/(.*/.*).rb") do |match|
  run_spec %{spec/#{match[1]}_spec.rb}
end
