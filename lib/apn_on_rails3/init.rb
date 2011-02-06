require 'socket'
require 'openssl'
require 'configatron'

rails_root = File.join(FileUtils.pwd, 'rails_root')
if defined?(RAILS_ROOT)
  rails_root = RAILS_ROOT
end

rails_env = 'development'
if defined?(RAILS_ENV)
  rails_env = RAILS_ENV
end

# -- Require all the model classes
base = File.join(File.dirname(__FILE__), 'app', 'models', 'apn', 'base.rb')
require base

Dir.glob(File.join(File.dirname(__FILE__), 'app', 'models', 'apn', '*.rb')).sort.each do |f|
  require f
end
# --

# -- Add everything under the app folder
%w{ models controllers helpers }.each do |dir| 
  path = File.join(File.dirname(__FILE__), 'app', dir)
  $LOAD_PATH << path 
  # puts "Adding #{path}"
  begin
    if ActiveSupport::Dependencies.respond_to? :autoload_paths
      ActiveSupport::Dependencies.autoload_paths << path
      ActiveSupport::Dependencies.autoload_once_paths.delete(path)
    else
      ActiveSupport::Dependencies.load_paths << path 
      ActiveSupport::Dependencies.load_once_paths.delete(path) 
    end
  rescue NameError
    Dependencies.load_paths << path 
    Dependencies.load_once_paths.delete(path) 
  end
end
# --