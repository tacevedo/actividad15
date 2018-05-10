file = File.open "productos.txt"
data = file.readlines
file.close

opcion = ''
until opcion == 6 do
  puts "Ingresa opcion: 1: cantidad de productos \n 2: stock de un producto \n 3: productos no bodega \n 4: productos con menos cant qe \n 5: registrar nuebo \n 6: salir \n "
  opcion = gets.chomp
  case opcion
  when "1"
    submenu = ''
    until submenu == 'd' do
      puts "Ingresa opcion:\n a: Mostrar existencia por productos \n b: Mostrar la existencia total por tienda. \n c: Mostrar la existencia total en todas las tiendas. \n d: Volver a menu ppal \n "

      submenu = gets.chomp
      case submenu
      when "a"
          # Mostrar la existencia por productos.
        pro = data.each do |linea|
            valor = linea.split(' ')
            suma = 0
            valor.each_with_index do |dato, i|
              if i != 0 && dato != 'NR'
                dato = dato.to_i
                suma += dato
              end
            end
            puts "#{valor[0]} = #{suma}\n"
        end

      when "b"
        # Mostrar la existencia total por tienda.

      when "c"
        #) Mostrar la existencia total en todas las tiendas.
        suma = 0
         pro = data.each do |linea|
            valor = linea.split(' ')

            valor.each_with_index do |dato, i|
              if i != 0 && dato != 'NR'
                dato = dato.to_i
                suma += dato
              end
            end

        end
        puts "Total productos en todas las tiendas = #{suma}\n"

      when "d"
        break
      else
        puts "opcion incorrecta"
      end
    end

  when "2"
  # permite que el usuario ingrese el nombre de un producto y el programa responderá con la cantidad de stock total (suma en las bodegas) de ese producto.
  puts "ingrese el nombre de un producto para contar su stock"
  productostock = gets.chomp

  pro = data.each do |linea|
      valor = linea.gsub(',', '').split(' ')
      suma = 0

      if valor[0] == productostock

        valor.each_with_index do |dato, i|
          if i != 0 && dato != 'NR'
            dato = dato.to_i
            suma += dato
          end

        end
          puts "#{valor[0]} = #{suma}\n" if valor[0] == productostock
      end
  end
  when "3"
    # muestra los productos no registrados en cada bodega.

  when "4"
    # permite conocer los productos con una existencia total menor a un valor ingresado por el usuario.

  when "5"
    # permite registrar un nuevo producto con su respectivo stock en cada bodega. (Hint: abrir el archivo como append).

  when "6"
    puts 'Adios'
    break
  else
    puts "opcion incorrecta"
  end
end
