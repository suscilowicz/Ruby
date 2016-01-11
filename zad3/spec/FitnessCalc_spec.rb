require 'SimpleCov'
SimpleCov.start
require 'FitnessCalc'
require 'fox16'
include Fox

describe '#test app' do
  FXApp.new do |app|
    fc = FitnessCalcView.new(app, "TEST")
    context 'new app' do
      it 'create new app' do
        expect(fc).to be_instance_of(FitnessCalcView)
      end
      it 'weight is empty' do
        expect(fc.weightTextField.text).to eq('')
      end
      it 'height is empty' do
        expect(fc.heightTextField.text).to eq('')
      end
      it 'age is empty' do
        expect(fc.oldTextField.text).to eq('')
      end
      it 'protein is empty' do
        expect(fc.proteinTextField.text).to eq('')
      end
      it 'carbo is empty' do
        expect(fc.carboTextField.text).to eq('')
      end
      it 'fat is empty' do
        expect(fc.fatTextField.text).to eq('')
      end
      it 'errors list is empty' do
        expect(fc.errors).to eq('')
      end
    end
    context 'correct values' do
      before do
        fc.weightTextField.text = '80'
        fc.heightTextField.text = '175'
        fc.oldTextField.text = '20'
        fc.proteinTextField.text = '30'
        fc.carboTextField.text = '35'
        fc.fatTextField.text = '35'
      end
      it 'weight is correct' do
        expect(fc.weightTextField.text).to_not be_nil
        expect(fc.weightTextField.text.to_i).to be > 0
        expect(fc.weightTextField.text.to_i).to eq(80)
      end
      it 'height is correct' do
        expect(fc.heightTextField.text).to_not be_nil
        expect(fc.heightTextField.text.to_i).to be > 0
        expect(fc.heightTextField.text.to_i).to eq(175)
      end
      it 'age is correct' do
        expect(fc.oldTextField.text).to_not be_nil
        expect(fc.oldTextField.text.to_i).to be > 0
        expect(fc.oldTextField.text.to_i).to eq(20)
      end
      it 'protein is correct' do
        expect(fc.proteinTextField.text).to_not be_nil
        expect(fc.proteinTextField.text.to_i).to be > 0
        expect(fc.proteinTextField.text.to_i).to eq(30)
      end
      it 'carbo is correct' do
        expect(fc.carboTextField.text).to_not be_nil
        expect(fc.carboTextField.text.to_i).to be > 0
        expect(fc.carboTextField.text.to_i).to eq(35)
      end
      it 'fat is correct' do
        expect(fc.fatTextField.text).to_not be_nil
        expect(fc.fatTextField.text.to_i).to be > 0
        expect(fc.fatTextField.text.to_i).to eq(35)
      end
    end
    context 'return correct results' do
      before do
        fc.calculate(1,2,3)
      end
      it 'bmi result is correct' do
        expect(fc.bmiTextField.text).to_not be_nil
        expect(fc.bmiTextField.text).to eq('26.12')
      end
      it 'calories result is correct' do
        expect(fc.caloriesTextField.text).to_not be_nil
        expect(fc.caloriesTextField.text).to eq('2868')
      end
      it 'protein result is correct' do
        expect(fc.proteinResultTextField.text).to_not be_nil
        expect(fc.proteinResultTextField.text).to eq('860')
      end
      it 'carbo result is correct' do
        expect(fc.carboResultTextField.text).to_not be_nil
        expect(fc.carboResultTextField.text).to eq('1003')
      end
      it 'fat result is correct' do
        expect(fc.fatResultTextField.text).to_not be_nil
        expect(fc.fatResultTextField.text).to eq('1003')
      end
    end
    context 'click clear data' do
      before do
        fc.clearData(1,2,3)
      end
      it 'weight is empty' do
        expect(fc.weightTextField.text).to eq('')
      end
      it 'height is empty' do
        expect(fc.heightTextField.text).to eq('')
      end
      it 'age is empty' do
        expect(fc.oldTextField.text).to eq('')
      end
      it 'protein is empty' do
        expect(fc.proteinTextField.text).to eq('')
      end
      it 'carbo is empty' do
        expect(fc.carboTextField.text).to eq('')
      end
      it 'fat is empty' do
        expect(fc.fatTextField.text).to eq('')
      end
    end
    context 'click clear results' do
      before do
        fc.clearResults(1,2,3)
      end
      it 'bmi result is empty' do
        expect(fc.bmiTextField.text).to eq('')
      end
      it 'calories result is empty' do
        expect(fc.caloriesTextField.text).to eq('')
      end
      it 'protein result is empty' do
        expect(fc.proteinResultTextField.text).to eq('')
      end
      it 'carbo result is empty' do
        expect(fc.carboResultTextField.text).to eq('')
      end
      it 'fat result is empty' do
        expect(fc.fatResultTextField.text).to eq('')
      end
    end
    context 'check errors when values are empty' do
      before do
        fc.aChange(1)
        fc.calculate(1,2,3)
      end
      it 'height is null: puts info about it' do
        expect(fc.heightTextField.text).to eq('')
        expect(fc.errors).to include('Wprowadź wzrost!')
      end
      it 'weight is null: puts info about it' do
        expect(fc.weightTextField.text).to eq('')
        expect(fc.errors).to include('Wprowadź wagę!')
      end
      it 'age is null: puts info about it' do
        expect(fc.oldTextField.text).to eq('')
        expect(fc.errors).to include('Wprowadź wiek!')
      end
      it 'protein is null: puts info about it' do
        expect(fc.proteinTextField.text).to eq('')
        expect(fc.errors).to include('Wprowadź wartość procentową białka!')
      end
      it 'carbo is null: puts info about it' do
        expect(fc.carboTextField.text).to eq('')
        expect(fc.errors).to include('Wprowadź wartość procentową węglowodanów!')
      end
      it 'fat is null: puts info about it' do
        expect(fc.fatTextField.text).to eq('')
        expect(fc.errors).to include('Wprowadź wartość procentową tłuszczu!')
      end
    end
    context 'check errors when values are incorrect' do
      before do
        fc.weightTextField.text = '0'
        fc.heightTextField.text = '-1'
        fc.oldTextField.text = '-1'
        fc.proteinTextField.text = '-25'
        fc.carboTextField.text = '-15'
        fc.fatTextField.text = '150'
        fc.aChange(1)
        fc.calculate(1,2,3)
      end
      it 'weight is less than 1: puts info about it' do
        expect(fc.weightTextField.text.to_i).to be < 1
        expect(fc.errors).to include('Wartość wagi musi być większa od 1')
      end
      it 'height is less than 1: puts info about it' do
        expect(fc.heightTextField.text.to_i).to be < 1
        expect(fc.errors).to include('Wartość wzrostu musi być większa od 1')
      end
      it 'age is less than 1: puts info about it' do
        expect(fc.oldTextField.text.to_i).to be < 1
        expect(fc.errors).to include('Wartość wieku musi być większa od 1')
      end
      it 'protein is less than 1 or is greater than 100: puts info about it' do
        expect(fc.proteinTextField.text.to_i).to_not be_between(1, 100).inclusive
        expect(fc.errors).to include('Wartość procentowa białka musi się zawierać w przedziale od 1 do 100')
      end
      it 'carbo is less than 1 or is greater than 100: puts info about it' do
        expect(fc.carboTextField.text.to_i).to_not be_between(1, 100).inclusive
        expect(fc.errors).to include('Wartość procentowa węglowodanow musi się zawierać w przedziale od 1 do 100')
      end
      it 'fat is less than 1 or is greater than 100: puts info about it' do
        expect(fc.fatTextField.text.to_i).to_not be_between(1, 100).inclusive
        expect(fc.errors).to include('Wartość procentowa tłuszczu musi się zawierać w przedziale od 1 do 100')
      end
      it 'sum of carbo, fat and protein is not 100' do
        expect(fc.proteinTextField.text.to_i+fc.carboTextField.text.to_i+fc.fatTextField.text.to_i).to_not eq(100)
        expect(fc.errors).to include('Suma wartości procentowych białka, węglowodanów i tłuszczu musi być równa 100!')
      end
    end
    app.exit
  end
end
