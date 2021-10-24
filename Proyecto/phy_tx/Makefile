#Banderas:
CC = iverilog #Compilador
#TIME = #Valores de tiempos a utilizar
#LIBS =	#Librerias externas

all: verificacion_phy_tx

verificacion_phy_tx: sintesis_phy_tx exe_phy_tx
#Simular:
	vvp exe-verificacion_phy_tx.o
#Ver en gtkwave:
	gtkwave verificacion_phy_tx.vcd

sintesis_phy_tx:
	yosys -s  phy_tx.ys
	sed -i 's/phy_tx/phy_tx_sintetizado/g' phy_tx_sintetizado.v
	sed -i 's/data_out_lane_0/data_out_lane_0_sintetizado/g' phy_tx_sintetizado.v
	sed -i 's/data_out_lane_1/data_out_lane_1_sintetizado/g' phy_tx_sintetizado.v
	sed -i 's/valid_out_32bto8b_lane0/valid_out_32bto8b_lane0_sintetizado/g' phy_tx_sintetizado.v
	sed -i 's/valid_out_32bto8b_lane1/valid_out_32bto8b_lane1_sintetizado/g' phy_tx_sintetizado.v
	sed -i 's/paraleloSerial/paraleloSerial_sintetizado/g' phy_tx_sintetizado.v
	sed -i 's/paso32bto8b/paso32bto8b_sintetizado/g' phy_tx_sintetizado.v
	sed -i 's/byteStriping/byteStriping_sintetizado/g' phy_tx_sintetizado.v

exe_phy_tx:
#Compilar:
	emacs --batch phy_tx_tb.v -f verilog-batch-auto
	$(CC) phy_tx_tb.v cmos_cells.v -o exe-verificacion_phy_tx.o

.PHONY: all clean help
clean:
	rm -f *.o *.vcd
rmsynth:
	rm -f phy_tx_sintetizado.v
help:
	cat README
