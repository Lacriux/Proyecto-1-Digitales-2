#Banderas:
CC = iverilog #Compilador
#TIME = #Valores de tiempos a utilizar
#LIBS =	#Librerias externas

all: verificacion_byteStriping 

verificacion_byteStriping: sintesis_byteStriping exe_byteStriping
#Simular:
	vvp exe-verificacion_byteStriping.o
#Ver en gtkwave:
	gtkwave verificacion_byteStriping.vcd 

sintesis_byteStriping:
	yosys -s  sintesis_byteStriping.ys
	sed -i 's/byteStriping/byteStriping_sintetizado/g' byteStriping_sintetizado.v
	sed -i 's/lane_0/lane_0_sintetizado/g' byteStriping_sintetizado.v
	sed -i 's/lane_1/lane_1_sintetizado/g' byteStriping_sintetizado.v
	sed -i 's/valid_0/valid_0_sintetizado/g' byteStriping_sintetizado.v
	sed -i 's/valid_1/valid_1_sintetizado/g' byteStriping_sintetizado.v

exe_byteStriping:
#Compilar:
	emacs --batch byteStriping_tb.v -f verilog-batch-auto
	$(CC) byteStriping_tb.v cmos_cells.v -o exe-verificacion_byteStriping.o

.PHONY: all clean help
clean:
	rm -f *.o *.vcd 
rmsynth:
	rm -f byteStriping_sintetizado.v  
help: 
	cat README 