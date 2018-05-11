file = File.open "productos.txt"
data = file.readlines
file.close

opcion = ''
until opcion == 6 do
  puts "\nIngresa opcion:\n 1: cantidad de productos \n 2: stock de un producto \n 3: productos no bodega \n 4: productos con menos cant qe \n 5: registrar nuebo \n 6: salir \n "
  opcion = gets.chomp
  case opcion
  when "1"
    submenu = ''
    until submenu == 'd' do
      puts "\nIngresa opcion:\n a: Mostrar existencia por productos \n b: Mostrar la existencia total por tienda. \n c: Mostrar la existencia total en todas las tiendas. \n d: Volver a menu ppal \n "
      submenu = gets.chomp

      case submenu
      when "a"
        # Mostrar la existencia por productos.
        pro = data.each do |linea|
          valor = linea.gsub(',', '').split(' ')
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
        existencias = {"bodega1" => 0,"bodega2" => 0,"bodega3" => 0}
        pro = data.each do |linea|
            valor = linea.gsub(',', '').split(' ')
            suma = 0
            valor.each_with_index do |dato, i|
               if i != 0 && dato != 'NR'
                 dato = dato.to_i
                 existencias["bodega#{i}"] +=  dato
               end
            end
        end
        puts "Bodega 1 tiene: #{existencias['bodega1']}"
        puts "Bodega 2 tiene: #{existencias['bodega2']}"
        puts "Bodega 3 tiene: #{existencias['bodega3']}"

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
    nr = {"bodega1" => '',"bodega2" => '',"bodega3" => ''}
    pro = data.each do |linea|
        valor = linea.gsub(',', '').split(' ')
        valor.each_with_index do |dato, i|
           if  dato == 'NR'
             nr["bodega#{i}"] += "#{valor[0]} "
           end
        end
    end
    puts "Bodega 1 no registra: #{nr['bodega1']}"
    puts "Bodega 2 no registra: #{nr['bodega2']}"
    puts "Bodega 3 no registra: #{nr['bodega3']}"
  when "4"
    # permite conocer los productos con una existencia total menor a un valor ingresado por el usuario.
    puts "ingrese un valor y mostraremos los productos con menor existencia"
    menora = gets.chomp.to_i
    pro = data.each do |linea|
      valor = linea.split(' ')
      suma = 0
      valor.each_with_index do |dato, i|
        if i != 0 && dato != 'NR'
          dato = dato.to_i
          suma += dato
        end
      end

      puts "#{valor[0]} = #{suma}\n" if suma < menora
    end

  when "5"
    # permite registrar un nuevo producto con su respectivo stock en cada bodega. (Hint: abrir el archivo como append).
    puts "ingrese nombre producto"
    name = gets.chomp
    puts "ingrese el numero para cantidad en bodega 1 (o NR para no registrado)"
    bodega1 = gets.chomp
    puts "ingrese el numero para cantidad en bodega 2 (o NR para no registrado)"
    bodega2 = gets.chomp
    puts "ingrese el numero para cantidad en bodega 3 (o NR para no registrado)"
    bodega3 = gets.chomp

    File.open( "productos.txt", "a"){ |f|
      f.puts "#{name}, #{bodega1}, #{bodega2}, #{bodega3}\n"
      puts "producto ingresado:  #{name}, #{bodega1}, #{bodega2}, #{bodega3}\n"
      f.close
    }

  when "6"
    puts 'Adios'
    break
  else
    puts "opcion incorrecta"
  end
end
