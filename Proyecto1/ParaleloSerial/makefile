#Banderas:
CC = iverilog #Compilador
#TIME = #Valores de tiempos a utilizar
#LIBS =	#Librerias externas

all: verificacion_paraleloSerial

verificacion_paraleloSerial: sintesis_paraleloSerial exe_paraleloSerial
#Simular:
	vvp exe-verificacion_paraleloSerial.o
#Ver en gtkwave:
	gtkwave verificacion_paraleloSerial.vcd

sintesis_paraleloSerial:
	yosys -s  sintesis_paraleloSerial.ys
	sed -i 's/paraleloSerial/paraleloSerial_sintetizado/g' paraleloSerial_sintetizado.v
	sed -i 's/data_out/data_out_sintetizado/g' paraleloSerial_sintetizado.v

exe_paraleloSerial:
#Compilar:
	emacs --batch paraleloSerial_tb.v -f verilog-batch-auto
	$(CC) paraleloSerial_tb.v cmos_cells.v -o exe-verificacion_paraleloSerial.o

.PHONY: all clean help
clean:
	rm -f *.o *.vcd
rmsynth:
	rm -f paraleloSerial_sintetizado.v
help:
	cat README
