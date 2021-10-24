#Banderas:
CC = iverilog #Compilador

#TIME = #Valores de tiempos a utilizar
#LIBS =	#Librerias externas

all: verificacion_phy

verificacion_phy: sintesis_phy exe_phy
#Simular:
	vvp exe-verificacion_phy.o
#Ver en gtkwave:
	gtkwave verificacion_phy.vcd

sintesis_phy:
	yosys -s  sintesis_phy.ys
	sed -i 's/phy/phy_sintetizado/g' phy_sintetizado.v
	sed -i 's/valid_out/valid_out_sintetizado/g' phy_sintetizado.v
	sed -i 's/data_out/data_out_sintetizado/g' phy_sintetizado.v
	sed -i 's/serialParalelo/serialParalelo_sintetizado/g' phy_sintetizado.v
	sed -i 's/paso8bto32b/paso8bto32b_sintetizado/g' phy_sintetizado.v
	sed -i 's/byteUnstriping/byteUnstriping_sintetizado/g' phy_sintetizado.v
	sed -i 's/paraleloSerial/paraleloSerial_sintetizado/g' phy_sintetizado.v
	sed -i 's/paso32bto8b/paso32bto8b_sintetizado/g' phy_sintetizado.v
	sed -i 's/byteStriping/byteStriping_sintetizado/g' phy_sintetizado.v

exe_phy:
#Compilar:
	emacs --batch phy_tb.v -f verilog-batch-auto
	$(CC) phy_tb.v cmos_cells.v -o exe-verificacion_phy.o

.PHONY: all clean help
clean:
	rm -f *.o *.vcd
rmsynth:
	rm -f phy_sintetizado.v
help:
	cat README
