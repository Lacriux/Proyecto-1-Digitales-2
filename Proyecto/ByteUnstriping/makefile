#Banderas:
CC = iverilog #Compilador
#TIME = #Valores de tiempos a utilizar
#LIBS =	#Librerias externas

all: verificacion_byteUnstriping

verificacion_byteUnstriping: sintesis_byteUnstriping exe_byteUnstriping
#Simular:
	vvp exe-verificacion_byteUnstriping.o
#Ver en gtkwave:
	gtkwave verificacion_byteUnstriping.vcd

sintesis_byteUnstriping:
	yosys -s  sintesis_byteUnstriping.ys
	sed -i 's/byteUnstriping/byteUnstriping_sintetizado/g' byteUnstriping_sintetizado.v
	sed -i 's/data_out/data_out_sintetizado/g' byteUnstriping_sintetizado.v
	sed -i 's/valid_out/valid_out_sintetizado/g' byteUnstriping_sintetizado.v

exe_byteUnstriping:
#Compilar:
	emacs --batch byteUnstriping_tb.v -f verilog-batch-auto
	$(CC) byteUnstriping_tb.v cmos_cells.v -o exe-verificacion_byteUnstriping.o

.PHONY: all clean help
clean:
	rm -f *.o *.vcd
rmsynth:
	rm -f byteUnstriping_sintetizado.v
help:
	cat README
