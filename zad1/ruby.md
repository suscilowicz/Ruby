## Zaczynamy przygodę z Ruby

### Array

##### Tworzenie
- Pusta tablica
```ruby
array = []
```
- Tablica wypelniona elementami
```ruby
array = [1, 2, 3, 4, 5, 'szesc', 8 - 1]
```
##### Wyswietlanie
- Cala zawartosc tablicy
```ruby
puts array #=>[1, 2, 3, 4, 5, 'szesc', 7]
```
- Wskazany element
```ruby
puts array[2] #=> 3
puts array.at(2) #=> 3
puts array[-2] #=> szesc
puts array.first #=> 1
puts array.last #=> 7
```
- Wskazane elementy
```ruby
puts array[0, 2] #=> [1, 2]
n = 3 # definiujemy zmienna n i przypisujemy 3
puts array.take(n) #=> [1,2,3]
puts array.drop(n) #=> [4,5,'szesc',7]
```
##### Uzyskanie informacji o tablicy
- Ilosc elementow
```ruby
puts array.length #=> 7
puts array.size #=> 7
puts array.count #=> 7
```
- Sprawdzenie, czy tablica jest pusta
```ruby
puts array.empty? #=> false
```
- Sprawdzenie, czy tablica posiada podany element
```ruby
puts array.include?(8 - 1) #=> true
puts array.include?('piec') #=> false
```
##### Dodawanie i usuwanie elementow
```ruby
array.push('ostatni')
#=> #=>[1, 2, 3, 4, 5, 'szesc', 7, 'ostatni']
array << ('last')
#=>[1, 2, 3, 4, 5, 'szesc', 7, 'ostatni', 'last']
array.unshift(0)
#=>[0, 1, 2, 3, 4, 5, 'szesc', 7, 'ostatni', 'last']
array.insert(2, 2)
#=>[0, 1, 2, 2, 3, 4, 5, 'szesc', 7, 'ostatni', 'last']
array.insert(0, 1, 4, 4, 'szesc', nil)
#=>[1, 4, 4, 'szesc', nil, 0, 1, 2, 2, 3, 4, 5, 'szesc', 7, 'ostatni', 'last']

array.pop
#=>[1, 4, 4, 'szesc', nil, 0, 1, 2, 2, 3, 4, 5, 'szesc', 7, 'ostatni']
array.shift
#=>[4, 4, 'szesc', nil, 0, 1, 2, 2, 3, 4, 5, 'szesc', 7, 'ostatni']
array.delete_at(1)
#=>[4, 'szesc', nil, 0, 1, 2, 2, 3, 4, 5, 'szesc', 7, 'ostatni']
array.delete('ostatni')
#=>[4, 'szesc', nil, 0, 1, 2, 2, 3, 4, 5, 'szesc', 7]
array.compact! # usuniecie pustych elementow z tablicy
#=>[4, 'szesc', 0, 1, 2, 2, 3, 4, 5, 'szesc', 7]
array.uniq! # usuniecie elementow, ktore sie powtarzaja
#=>[4, 'szesc', 0, 1, 2, 3, 5, 7]
```
### Enumerable
```Ruby
array = %w(Audi Mercedes Porshe Fiat Seat Opel Bugatti Skoda)
```
##### Sprawdzanie warunkow
```Ruby
puts array.all? { |a| a.length >= 5 } # sprawdza czy wszystkie elementy spelniaja warunek
#=> false
puts array.any? { |a| a.length >= 3 } # sprawdza czy jakikolwiek element spelnia warunek
#=> true
puts array.none? { |a| a.length >= 3 } # sprawdza czy kazdy element nie spelnia warunku
#=> false
puts array.one? { |a| a.length >= 3 } # sprawdza czy dokladnie jeden element spelnia warunek
#=> false
puts array.detect { |a| a == 'Seat' } # przeszukiwanie az do spelnienia warunku
#=> Seat
puts array.find_all { |a| a[0] == 'S' } # wyswietla elementy spelniajace warunek
#=> ['Seat', 'Skoda']
```
##### Wartosci minimalne, maksymalne oraz sortowanie
```ruby
puts array.min
#=> Audi
puts array.max
#=> Skoda
puts array.sort # sortowanie
#=> ['Audi', 'Bugatti', 'Fiat', 'Mercedes', 'Opel', 'Porshe', 'Seat', 'Skoda']
```

### Hash
Sie robi sie
