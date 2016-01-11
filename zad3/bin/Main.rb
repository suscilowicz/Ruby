require_relative '../lib/FitnessCalc.rb'

if __FILE__ == $0
  FXApp.new do |app|
    FitnessCalcView.new(app, WINDOW_TITLE)
    app.create
    app.run
  end
end
