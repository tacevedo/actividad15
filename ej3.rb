#1
def palabras ()
  pelis = File.open "peliculas.txt"
  lineas = pelis.read.split(' ')
  pelis.close
  lineas.length
end

puts palabras()


#2
def busca (word)
  pelis = File.open "peliculas.txt"
  palabras = pelis.read.split(' ')
  suma = 0
  palabras.map do |palabra|
     suma +=1 if palabra.downcase == word.downcase
  end
  pelis.close
  suma
end
pal = 'guerra'
puts busca(pal)
