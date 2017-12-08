Pry.config.history.file = '~/.irb_history'

# use awesome_print if available
begin
  require 'awesome_print'
  AwesomePrint.pry!
rescue LoadError => err
  warn "No awesome_print: #{err}"
end
