require 'irb/completion'

IRB.conf[:SAVE_HISTORY] = 1024
IRB.conf[:HISTORY_FILE] = '~/.irb_history'
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:BACK_TRACE_LIMIT] = 128

# use awesome_print if available
begin
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError => err
  warn "No awesome_print: #{err}"
end

# Log Rails and/or ActiveRecord to STDOUT
# if defined?(Rails) && Rails.respond_to?(:logger=)
#   require 'logger'
#   Rails.logger = Logger.new(STDOUT)
# end
#
# if defined?(ActiveRecord) && ActiveRecord::Base.respond_to?(:logger=)
#   require 'logger'
#   ActiveRecord::Base.logger = Logger.new(STDOUT)
# end
