class Sudoku
   
  def initialize(string_num)
    @string_num = string_num
    @@tablero = Array.new(9) { Array.new(9) }
    @@aux =[]
  end

  def imprime_tablero #----------funcion que imprime el tablero-----------
    puts "---------------------"
    @@tablero.each_with_index do |value,fil|
        value.each_with_index do |casilla, col|
          

            if col < 8
              print "#{casilla} "
              if col ==2 || col == 5  
                print "| "
              end
              
            else
              puts casilla
              if fil ==2 || fil == 5  
                puts "- - - - - - - - - - - "
              end
            end
      end
    end
    puts "---------------------"
  end

  def board
    @@aux = @string_num.split(//)
    var = 0
    #----------------se hace el arreglo de 9 por 9------------
    for i in 0..8
      for j in 0..8
        @@tablero[i][j]= @@aux[var].to_i
        var += 1
      end
    end
    imprime_tablero
    #---------------comienza el analisis-----------
    array_falta =[]
    array_fila = []
    array_columna = []
    array_tres_x_tres = []
    while @@tablero.flatten.include?(0) 
      @@tablero.each_with_index do |value,fil|
        value.each_with_index do |casilla, col|
          if casilla == 0
            aux =[]
            array_fila= fila(fil)
            array_falta = faltante(array_fila)
            array_columna = columna(col)
            array_tres_x_tres = tres_x_tres(fil,col)
            array_falta.each do |fal|
              if array_columna.include?(fal) == false && 
                array_fila.include?(fal) == false && 
                array_tres_x_tres.include?(fal) == false
                aux << fal
              end
            end
            if aux.size > 1 
              @@tablero[fil][col] = 0
            else
              @@tablero[fil][col] = aux[0]
            end
          end
        end
      end
    end
  
    puts
    puts "Game Solved!"
    
    imprime_tablero
  end

  def faltante(fil) #hace un arreglo con los faltantes de la fila donde encontro cero
    faltantes = []
    (0..9).each do |x|
      if fil.include?(x) == false
        faltantes << x
      end
    end
    faltantes
  end

  def fila(num) #obtiene la fila donde encontro 0
    vacio_fila = []
    for i in 0..8
      vacio_fila << @@tablero[num][i]
    end
    vacio_fila
  end

  def columna(num) #obtiene la columna donde encontro el 0
    vacio_columna = []
    for i in 0..8
      vacio_columna << @@tablero[i][num]
    end
    vacio_columna
  end

  def tres_x_tres(num1,num2) #obtiene el arreglo de 3x3 donde encontro el 0
    vacio_tres = []
    case 
    when num1 <= 2 && num2 <=2 #case1
    x = 0
    y= 0 
      for i in 0..8
        if y < 2 
          vacio_tres << @@tablero[x][y]
          y += 1
        else
          vacio_tres << @@tablero[x][y]
          y = 0
          x+=1
        end
      end
    when num1 <= 2 && (num2 >=3 && num2 <=5)   #case2
    x = 0
    y= 3 
      for i in 0..8
        if y < 5 
          vacio_tres << @@tablero[x][y]
          y += 1
        else
          vacio_tres << @@tablero[x][y]
          y = 3
          x+=1
        end
      end
    when num1 <= 2 && (num2 >=6 && num2 <=8)    #case3
    x = 0
    y= 6 
      for i in 0..8
        if y < 8 
          vacio_tres << @@tablero[x][y]
          y += 1
        else
          vacio_tres << @@tablero[x][y]
          y = 6
          x+=1
        end
      end
    when (num1 >=3 && num1 <=5) && num2 <=2    #case4
    x = 3
    y= 0 
      for i in 0..8
        if y < 2 
          vacio_tres << @@tablero[x][y]
          y += 1
        else
          vacio_tres << @@tablero[x][y]
          y = 0
          x+=1
        end
      end
    when (num1 >=3 && num1 <=5) && (num2 >=3 && num2 <=5)   #case5
    x = 3
    y= 3 
      for i in 0..8
        if y < 5 
          vacio_tres << @@tablero[x][y]
          y += 1
        else
          vacio_tres << @@tablero[x][y]
          y = 3
          x+=1
        end
      end
    when (num1 >=3 && num1 <=5) && (num2 >=6 && num2 <=8)    #case6
    x = 3
    y= 6 
      for i in 0..8
        if y < 8 
          vacio_tres << @@tablero[x][y]
          y += 1
        else
          vacio_tres << @@tablero[x][y]
          y = 6
          x+=1
        end
      end
    when (num1 >=6 && num1 <=8) && num2 <=2      #case7
    x = 6
    y= 0 
      for i in 0..8
        if y < 2 
          vacio_tres << @@tablero[x][y]
          y += 1
        else
          vacio_tres << @@tablero[x][y]
          y = 0
          x+=1
        end
      end
    when (num1 >=6 && num1 <=8) && (num2 >=3 && num2 <=5)      #case8
    x = 6
    y= 3 
      for i in 0..8
        if y < 5 
          vacio_tres << @@tablero[x][y]
          y += 1
        else
          vacio_tres << @@tablero[x][y]
          y = 3
          x+=1
        end
      end
    when (num1 >=6 && num1 <=8) && (num2 >=6 && num2 <=8)      #case9
    x = 6
    y= 6 
      for i in 0..8
        if y < 8 
          vacio_tres << @@tablero[x][y]
          y += 1
        else
          vacio_tres << @@tablero[x][y]
          y = 6
          x+=1
        end
      end
    end
    vacio_tres  
  end 
 

end #el end de la clase





#game = Sudoku.new('742836519196745238385921476458307692619284753237659184573492861964178325821563947')
game = Sudoku.new('702806519100740230005001070008000002610204053200000100070400800064078005821503907')
game.board






