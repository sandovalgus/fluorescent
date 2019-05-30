
hours = ((15*5)*4)*9 #((hours per day*days of week)*week in month)*9 month

# create classroom
@classroom = [[],[],[], []] #
# light_out = Array.new(4)
light_out = [0,0,0,0]
fluorescents_bloke=0 #  cant of fluorescents broken
change_unit=0 #change units (one unit of 4 flourescents)

# load values hours chnage unit new
def recargar(unit)
		0.step(3, 1) do |light|
			@classroom[unit][light] = rand(100..200)
		end
end

# load units
0.step(3, 1) do |unit|
	recargar(unit)
end

0.step(3, 1) do |unit|
	puts "unidad - #{unit} "
	0.step(3, 1) do |light|
		 puts "light #{light} ... horas  #{@classroom[unit][light]}"
		
	end
end
	
for hrs in 1..hours
	
		0.step(3, 1) do |unit|
			
			0.step(3, 1) do |light|

				if(@classroom[unit][light] >=0)# if flourescents hours >=0
					@classroom[unit][light]-=1
				end

				if(@classroom[unit][light]==0)
					 light_out[unit]+=1 # +1 flourescents broke in units
					 @classroom[unit][light]=-1
					 fluorescents_bloke+=1 
				end				
				if(light_out[unit]>=2)
					# if unit two broken fluorescents, change unit
					light_out[unit]=0
					recargar unit #load new flourescents in unit
					change_unit+=1; #unit changes +1
				end

			end
		end
end

cost = (change_unit*4)*7

p "En el año se rompieron #{fluorescents_bloke} fluorescentes"
p ",y genero un costo por cambio de unidad de #{cost} USD por aula"
p "Se tiene en cuenta que se toma como un gasto cuando se reemplaza una unidad entera"




