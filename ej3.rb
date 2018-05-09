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
  lineas = pelis.read.split(' ')
  suma = 0
  lineas.map do |v|
     suma +=1 if v.downcase == word.downcase
  end
  pelis.close
  suma
end
pal = 'guerra'
puts busca(pal)
