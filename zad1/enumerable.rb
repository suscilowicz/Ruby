array = %w(Audi Mercedes Porshe Fiat Seat Opel Bugatti Skoda)

puts array.all? { |a| a.length >= 5 } # sprawdza czy wszystkie elementy spelniaja warunek
puts array.any? { |a| a.length >= 3 } # sprawdza czy jakikolwiek element spelnia warunek
puts array.none? { |a| a.length >= 3 } # sprawdza czy kazdy element nie spelnia warunku
puts array.one? { |a| a.length >= 3 } # sprawdza czy dokladnie jeden element spelnia warunek
puts array.detect { |a| a == 'Seat' } # przeszukiwanie az do spelnienia warunku
puts array.find_all { |a| a[0] == 'S' } # wyswietla elementy spelniajace warunek

puts array.min
puts array.max # najmniejszy i najwiekszy element
puts array.sort # sortowanie
