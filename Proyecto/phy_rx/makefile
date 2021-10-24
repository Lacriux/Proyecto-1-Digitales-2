#Banderas:
CC = iverilog #Compilador
#TIME = #Valores de tiempos a utilizar
#LIBS =	#Librerias externas

all: verificacion_phy_rx

verificacion_phy_rx: sintesis_phy_rx exe_phy_rx
#Simular:
	vvp exe-verificacion_phy_rx.o
#Ver en gtkwave:
	gtkwave verificacion_phy_rx.vcd

sintesis_phy_rx:
	yosys -s  sintesis_phy_rx.ys
	sed -i 's/phy_rx/phy_rx_sintetizado/g' phy_rx_sintetizado.v
	sed -i 's/valid_out_rx/valid_out_rx_sintetizado/g' phy_rx_sintetizado.v
	sed -i 's/data_out_rx/data_out_rx_sintetizado/g' phy_rx_sintetizado.v
	sed -i 's/serialParalelo/serialParalelo_sintetizado/g' phy_rx_sintetizado.v
	sed -i 's/paso8bto32b/paso8bto32b_sintetizado/g' phy_rx_sintetizado.v
	sed -i 's/byteUnstriping/byteUnstriping_sintetizado/g' phy_rx_sintetizado.v

exe_phy_rx:
#Compilar:
	emacs --batch phy_rx_tb.v -f verilog-batch-auto
	$(CC) phy_rx_tb.v cmos_cells.v -o exe-verificacion_phy_rx.o

.PHONY: all clean help
clean:
	rm -f *.o *.vcd
rmsynth:
	rm -f phy_rx_sintetizado.v
help:
	cat README
