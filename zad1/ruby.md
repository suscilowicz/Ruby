## Zaczynamy przygodę z Ruby

### Array
Tworzenie oraz wyswietlanie
```ruby
array = [] #tworzenie pustej tablicy
array = [1, 2, 3, 4, 5, 'szesc', 8 - 1] # tworzenie tablicy wypelnionej elementami
puts array # wyswietla tablice
puts array[2] # wyswietla trzeci element tablicy
puts array.at(2) # to co wyzej, inny zapis
puts array[-2] # wyswietla przedostatni element tablicy
puts array.first # wyswietla pierwszy element tablicy
puts array.last # wyswietla ostatni element tablicy
puts array[0, 2] # wyswietla elementy z zakresu 0-2 bez ostatniego
n = 3 # definiujemy zmienna n i przypisujemy 3
puts array.take(n) # wyswietla pierwsze n elementow
puts array.drop(n) # wyswietla wszystko procz pierwszych n elementow
```
Uzyskanie informacji o tablicy
```ruby
puts array.length # wyswietla ilosc elementow
puts array.size # jak wyzej
puts array.count #  jak wyzej

puts array.empty? # sprawdza czy tablica jest pusta
puts array.include?(8 - 1) # sprawdza czy tablica posiada podany element (true)
puts array.include?('piec') # sprawdza czy tablica posiada podany element (false)
```
Dodawanie i usuwanie elementow
```ruby
array.push('ostatni') # dodanie elemntu na koniec tablicy
array << ('jednak ten jest ostatni') # tak jak wyzej
array.unshift(0) # dodanie elementu na poczatek tablicy
array.insert(2, 2) # dodanie elementu na pozycji 2
array.insert(0, 1, 4, 4, 'szesc', nil) # mozna dodac takze pare elementow

array.pop # usuniecie ostatniego elementu
array.shift # usuniecie pierwszego elementu
array.delete_at(1) # usuniecie elementu o indexie 1
array.delete('ostatni') # usuniecie elementu o nazwie zawartej w nawiasie
array.compact! # usuniecie pustych elementow z tablicy
array.uniq! # usuniecie elementow, ktore sie powtarzaja
```
### Enumerable
Sie robi sie

### Hash
Sie robi sie
