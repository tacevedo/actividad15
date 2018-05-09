#1
def creaindex (str, str1)
  File.open('index.html', 'w') do |f|
    f.puts "<!DOCTYPE html>
    <html>
      <head>
        <meta charset='utf-8'>
        <title></title>
      </head>
      <body>"
     f.puts "\t\t<p> #{str} </p>"
     f.puts "\t\t<p> #{str1} </p>"
     f.puts "\t</body>\n</html>"
     f.close
   end

   return nil
end

creaindex('Tamara', 'Acevedo')

#2
def creaindexarr (str, str1, arr)
  File.open('index.html', 'w') do |f|
    f.puts "<!DOCTYPE html>
    <html>
      <head>
        <meta charset='utf-8'>
        <title></title>
      </head>
      <body>"
     f.puts "\t\t<p> #{str} </p>"
     f.puts "\t\t<p> #{str1} </p>"
     if arr.length != 0
        f.puts "\t\t<ol>\n"
        # f.puts arr
        arr.map do |a|
          f.puts "\t\t\t<li> #{a} </li>\n"
        end
        f.puts "\t\t</ol>\n"
     end
     f.puts "\t</body>\n</html>"
     f.close
   end

   return nil
end
arr = %w[sil pin]
creaindexarr('Tamara', 'Acevedo', arr)

#3
def creaindexarrcolor (str, str1, arr, color)
  File.open('index.html', 'w') do |f|
    f.puts "<!DOCTYPE html>
    <html>
      <head>
        <meta charset='utf-8'>
        <title>ejercicio 1</title>
        <style>
          p { background-color: #{color}}
        </style>
      </head>
      <body>"
     f.puts "\t\t<p> #{str} </p>"
     f.puts "\t\t<p> #{str1} </p>"
     if arr.length != 0
        f.puts "\t\t<ol>\n"
        # f.puts arr
        arr.map do |a|
          f.puts "\t\t\t<li> #{a} </li>\n"
        end
        f.puts "\t\t</ol>\n"
     end
     f.puts "\t</body>\n</html>"
     f.close
   end

   return nil
end
arr = %w[sil pin]
color = '#ccc'
creaindexarrcolor('Tamara', 'Acevedo', arr, color)
