require_relative './src/app'

def main
  app = App.new

  begin
    app.run
  rescue Interrupt
    app.exit!
  end
end

main
