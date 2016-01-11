class ResultCalc
  attr_reader   :bmi
  attr_reader   :calories
  attr_reader   :protein
  attr_reader   :carbo
  attr_reader   :fat

  def initialize(weight=0, height=0, old=0, proteinRate=0, carboRate=0, fatRate=0)
    @bmi = weight/(height/100.0)**2
    ppm = 66.5 + 13.75 * weight + 5.033 * height - 6.755 * old
    @calories = ppm * 1.5
    @protein = @calories * proteinRate/100.0
    @carbo = @calories * carboRate/100.0
    @fat = @calories * fatRate/100.0
  end
end
