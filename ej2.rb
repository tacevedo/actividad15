#1
def cuenta ()
  pelis = File.open "peliculas.txt"
  lineas = pelis.readlines
  pelis.close
  lineas.length
end

puts cuenta()
