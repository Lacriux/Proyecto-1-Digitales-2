#Banderas:
CC = iverilog #Compilador
#TIME = #Valores de tiempos a utilizar
#LIBS =	#Librerias externas

all: verificacion_paso32bto8b 

verificacion_paso32bto8b: sintesis_paso32bto8b exe_paso32bto8b
#Simular:
	vvp exe-verificacion_paso32bto8b.o
#Ver en gtkwave:
	gtkwave verificacion_paso32bto8b.vcd 

sintesis_paso32bto8b: sintesis_paso32bto8b.ys
	yosys -s  sintesis_paso32bto8b.ys
	sed -i 's/paso32bto8b/paso32bto8b_sintetizado/g' paso32bto8b_sintetizado.v
	sed -i 's/valid_out/valid_out_sintetizado/g' paso32bto8b_sintetizado.v
	sed -i 's/data_out/data_out_sintetizado/g' paso32bto8b_sintetizado.v

exe_paso32bto8b: paso32bto8b_tb.v
#Compilar:
	emacs --batch paso32bto8b_tb.v -f verilog-batch-auto
	$(CC) paso32bto8b_tb.v cmos_cells.v -o exe-verificacion_paso32bto8b.o

.PHONY: all clean help
clean:
	rm -f *.o *.vcd 
rmsynth:
	rm -f paso32bto8b_sintetizado.v  
help: 
	cat README 