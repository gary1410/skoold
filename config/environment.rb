# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Cfa::Application.initialize!

Time::DATE_FORMATS[:simple] = "%m/%d/%Y"
