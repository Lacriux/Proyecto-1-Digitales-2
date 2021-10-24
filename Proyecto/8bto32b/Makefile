#Banderas:
CC = iverilog #Compilador
#TIME = #Valores de tiempos a utilizar
#LIBS =	#Librerias externas

all: verificacion_8bto32b 

verificacion_8bto32b : sintesis_8bto32b exe_8bto32b 
#Simular:
	vvp exe-verificacion_paso8bto32b.o
#Ver en gtkwave:
	gtkwave verificacion_paso8bto32b.vcd 

sintesis_8bto32b :
	yosys -s  8bto32b.ys
	sed -i 's/paso8bto32b/paso8bto32b_sintetizado/g' paso8bto32b_sintetizado.v
	sed -i 's/valid_out/valid_out_sintetizado/g' paso8bto32b_sintetizado.v
	sed -i 's/data_out/data_out_sintetizado/g' paso8bto32b_sintetizado.v

exe_8bto32b:
#Compilar:
	emacs --batch paso8bto32b_tb.v -f verilog-batch-auto
	$(CC) paso8bto32b_tb.v cmos_cells.v -o exe-verificacion_paso8bto32b.o

.PHONY: all clean help
clean:
	rm -f *.o *.vcd 
rmsynth:
	rm -f paso8bto32b_sintetizado.v  
help: 
	cat README 