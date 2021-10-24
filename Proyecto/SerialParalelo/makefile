#Banderas:
CC = iverilog #Compilador
#TIME = #Valores de tiempos a utilizar
#LIBS =	#Librerias externas

all: verificacion_serialParalelo

verificacion_serialParalelo: sintesis_serialParalelo exe_serialParalelo
#Simular:
	vvp exe-verificacion_serialParalelo.o
#Ver en gtkwave:
	gtkwave verificacion_serialParalelo.vcd

sintesis_serialParalelo:
	yosys -s  sintesis_serialParalelo.ys
	sed -i 's/serialParalelo/serialParalelo_sintetizado/g' serialParalelo_sintetizado.v
	sed -i 's/data_out/data_out_sintetizado/g' serialParalelo_sintetizado.v
	sed -i 's/valid_out/valid_out_sintetizado/g' serialParalelo_sintetizado.v

exe_serialParalelo:
#Compilar:
	emacs --batch serialParalelo_tb.v -f verilog-batch-auto
	$(CC) serialParalelo_tb.v cmos_cells.v -o exe-verificacion_serialParalelo.o

.PHONY: all clean help
clean:
	rm -f *.o *.vcd
rmsynth:
	rm -f serialParalelo_sintetizado.v
help:
	cat README
