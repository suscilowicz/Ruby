require 'fox16'
require_relative 'ResultCalc.rb'
include Fox

WINDOW_WIDTH = 300
WINDOW_HEIGHT = 270
WINDOW_TITLE = "FitCalc"


class FitnessCalcView <FXMainWindow
  attr_reader   :resultCalc
  attr_reader   :weightTextField
  attr_reader   :heightTextField
  attr_reader   :oldTextField
  attr_reader   :proteinTextField
  attr_reader   :carboTextField
  attr_reader   :fatTextField
  attr_reader   :bmiTextField
  attr_reader   :caloriesTextField
  attr_reader   :proteinResultTextField
  attr_reader   :carboResultTextField
  attr_reader   :fatResultTextField
  attr_reader   :errors
  attr_reader   :a

  def clearData(sender, sel, data)
    weightTextField.text = ''
    heightTextField.text = ''
    oldTextField.text = ''
    proteinTextField.text = ''
    carboTextField.text = ''
    fatTextField.text = ''
  end

  def clearResults(sender, sel, data)
    proteinResultTextField.text = ""
    carboResultTextField.text = ""
    fatResultTextField.text = ""
    bmiTextField.text = ""
    caloriesTextField.text = ""
  end

  def calculate(sender, sel, data)
    @errors = ""
    if weightTextField.text.empty?
      @errors += "Wprowadź wagę!\n"
    elsif weightTextField.text.to_i < 1
      @errors += "Wartość wagi musi być większa od 1\n"
    end
    if heightTextField.text.empty?
      @errors += "Wprowadź wzrost!\n"
    elsif heightTextField.text.to_i < 1
      @errors += "Wartość wzrostu musi być większa od 1\n"
    end
    if oldTextField.text.empty?
      @errors += "Wprowadź wiek!\n"
    elsif oldTextField.text.to_i < 1
      @errors += "Wartość wieku musi być większa od 1\n"
    end
    if proteinTextField.text.empty?
      @errors += "Wprowadź wartość procentową białka!\n"
    elsif proteinTextField.text.to_i < 1 || proteinTextField.text.to_i > 100
      @errors += "Wartość procentowa białka musi się zawierać w przedziale od 1 do 100\n"
    end
    if carboTextField.text.empty?
      @errors += "Wprowadź wartość procentową węglowodanów!\n"
    elsif carboTextField.text.to_i < 1 || carboTextField.text.to_i > 100
      @errors += "Wartość procentowa węglowodanow musi się zawierać w przedziale od 1 do 100\n"
    end
    if fatTextField.text.empty?
      @errors += "Wprowadź wartość procentową tłuszczu!\n"
    elsif fatTextField.text.to_i < 1 || fatTextField.text.to_i > 100
      @errors += "Wartość procentowa tłuszczu musi się zawierać w przedziale od 1 do 100\n"
    end
    if (proteinTextField.text.to_i + carboTextField.text.to_i + fatTextField.text.to_i != 100)
      @errors += "Suma wartości procentowych białka, węglowodanów i tłuszczu musi być równa 100!\n"
    end

    if @errors.empty?
      weight = weightTextField.text.to_i
      height = heightTextField.text.to_i
      old = oldTextField.text.to_i
      proteinRate = proteinTextField.text.to_i
      carboRate = carboTextField.text.to_i
      fatRate = fatTextField.text.to_i

      @results = ResultCalc.new(weight, height, old, proteinRate, carboRate, fatRate)

      bmiTextField.text = @results.bmi.round(2).to_s
      caloriesTextField.text = @results.calories.to_i.to_s
      proteinResultTextField.text = @results.protein.to_i.to_s
      carboResultTextField.text = @results.carbo.to_i.to_s
      fatResultTextField.text = @results.fat.to_i.to_s
    elsif (@a == 0)
      FXMessageBox.warning(self, MBOX_OK, "ERRORS", @errors)
      #@errors = ""
      false
    else
    #  @errors = ''
      false
    end
  end

  def aChange(b)
    @a = b
  end

  def initialize(app, title)
    super(app, title, :width => WINDOW_WIDTH, :height => WINDOW_HEIGHT)
    @a = 0
    @errors = ""
    mainFrame = FXVerticalFrame.new(self, :opts => LAYOUT_FILL)

    dataFrame = FXHorizontalFrame.new(mainFrame, :opts => LAYOUT_FILL_X)
    basicDataFrame = FXMatrix.new(dataFrame, 2, :opts => MATRIX_BY_COLUMNS | LAYOUT_FILL_X)
    macroDataFrame = FXMatrix.new(dataFrame, 2, :opts => MATRIX_BY_COLUMNS | LAYOUT_FILL_X)

    buttonsDataFrame = FXHorizontalFrame.new(mainFrame, :opts => LAYOUT_FILL_X)

    weightLabel = FXLabel.new(basicDataFrame, "Waga (kg):")
    @weightTextField = FXTextField.new(basicDataFrame, 3, :opts => LAYOUT_FILL_X | LAYOUT_FILL_COLUMN | TEXTFIELD_NORMAL | TEXTFIELD_INTEGER)
    heightLabel = FXLabel.new(basicDataFrame, "Wzrost (cm):")
    @heightTextField = FXTextField.new(basicDataFrame, 3, :opts => LAYOUT_FILL_X | LAYOUT_FILL_COLUMN | TEXTFIELD_NORMAL | TEXTFIELD_INTEGER )
    oldLabel = FXLabel.new(basicDataFrame, "Wiek:")
    @oldTextField = FXTextField.new(basicDataFrame, 3, :opts => LAYOUT_FILL_X | LAYOUT_FILL_COLUMN | TEXTFIELD_NORMAL | TEXTFIELD_INTEGER)
    proteinLabel = FXLabel.new(macroDataFrame, "Białko (%):")
    @proteinTextField = FXTextField.new(macroDataFrame, 3, :opts => LAYOUT_FILL_X | LAYOUT_FILL_COLUMN | TEXTFIELD_NORMAL | TEXTFIELD_INTEGER)
    carboLabel = FXLabel.new(macroDataFrame, "Węglowodany (%):")
    @carboTextField = FXTextField.new(macroDataFrame, 3, :opts => LAYOUT_FILL_X | LAYOUT_FILL_COLUMN | TEXTFIELD_NORMAL | TEXTFIELD_INTEGER)
    fatLabel = FXLabel.new(macroDataFrame, "Tłuszcz (%):")
    @fatTextField = FXTextField.new(macroDataFrame, 3, :opts => LAYOUT_FILL_X | LAYOUT_FILL_COLUMN | TEXTFIELD_NORMAL | TEXTFIELD_INTEGER)


    computeButton = FXButton.new(buttonsDataFrame, "Oblicz", :opts => LAYOUT_FILL_X | BUTTON_NORMAL)

    clearDataButton = FXButton.new(buttonsDataFrame, "Wyczyść dane", :opts => LAYOUT_FILL_X | BUTTON_NORMAL)
    clearDataButton.connect(SEL_COMMAND, method(:clearData))

    FXSeparator.new(mainFrame)

    resultsFrame = FXHorizontalFrame.new(mainFrame, :opts => LAYOUT_FILL_X)

    basicResultsFrame = FXMatrix.new(resultsFrame, 2, :opts => MATRIX_BY_COLUMNS | LAYOUT_FILL_X)
    macroResultsFrame = FXMatrix.new(resultsFrame, 2, :opts => MATRIX_BY_COLUMNS | LAYOUT_FILL_X)

    bmiLabel = FXLabel.new(basicResultsFrame, "BMI:")
    @bmiTextField = FXTextField.new(basicResultsFrame, 3, :opts => LAYOUT_FILL_X | LAYOUT_FILL_COLUMN | TEXTFIELD_NORMAL | TEXTFIELD_READONLY)
    caloriesLabel = FXLabel.new(basicResultsFrame, "Kalorie:")
    @caloriesTextField = FXTextField.new(basicResultsFrame, 3, :opts => LAYOUT_FILL_X | LAYOUT_FILL_COLUMN | TEXTFIELD_NORMAL | TEXTFIELD_READONLY)

    proteinResultLabel = FXLabel.new(macroResultsFrame, "Białko (g):")
    @proteinResultTextField = FXTextField.new(macroResultsFrame, 3, :opts => LAYOUT_FILL_X | LAYOUT_FILL_COLUMN | TEXTFIELD_NORMAL | TEXTFIELD_READONLY)
    carboResultLabel = FXLabel.new(macroResultsFrame, "Węglowodany (g):")
    @carboResultTextField = FXTextField.new(macroResultsFrame, 3, :opts => LAYOUT_FILL_X | LAYOUT_FILL_COLUMN | TEXTFIELD_NORMAL | TEXTFIELD_READONLY)
    fatResultLabel = FXLabel.new(macroResultsFrame, "Tłuszcz (g):")
    @fatResultTextField = FXTextField.new(macroResultsFrame, 3, :opts => LAYOUT_FILL_X | LAYOUT_FILL_COLUMN | TEXTFIELD_NORMAL | TEXTFIELD_READONLY)

    clearResultsButton = FXButton.new(mainFrame, "Wyczyść obliczenia", :opts => LAYOUT_FILL_X | BUTTON_NORMAL)
    clearResultsButton.connect(SEL_COMMAND, method(:clearResults))

    computeButton.connect(SEL_COMMAND, method(:calculate))
  end

  def create
    super
    self.show(PLACEMENT_SCREEN)
  end
end
