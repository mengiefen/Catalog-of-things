require_relative './app'

def main
  app = App.new

  begin
    app.run
  rescue Interrupt
    app.exit!
  end
end

main
