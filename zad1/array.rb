array = [1, 2, 3, 4, 5, 'szesc', 8 - 1]
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

puts array.length # wyswietla ilosc elementow
puts array.size # jak wyzej
puts array.count #  jak wyzej

puts array.empty? # sprawdza czy tablica jest pusta
puts array.include?(8 - 1) # sprawdza czy tablica posiada podany element (true)
puts array.include?('piec') # jak wyzej (false)

array.push('ostatni') # dodanie elemntu na koniec tablicy
puts array
array << ('jednak ten jest ostatni')
puts array
array.unshift(0) # dodanie elementu na poczatek tablicy
puts array
array.insert(2, 2) # dodanie elementu na pozycji 2
puts array
array.insert(0, 1, 4, 4, 'szesc', nil) # mozna dodac takze pare elementow
puts array

array.pop # usuniecie ostatniego elementu
puts array
array.shift # usuniecie pierwszego elementu
puts array
array.delete_at(1) # usuniecie elementu o indexie 1
puts array
array.delete('ostatni') # usuniecie elementu o nazwie zawartej w nawiasie
puts array
array.compact! # usuniecie pustych elementow z tablicy
puts array
array.uniq! # usuniecie elementow, ktore sie powtarzaja
puts array
