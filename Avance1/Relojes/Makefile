CC1=iverilog
CC2=gtkwave
CC3=vvp
TARGET1=BancoPruebas.v
TARGET2=resultados.vcd



compilar: autoinst verilog vvp
	$(CC2) $(TARGET2)
autoinst:
	emacs --batch $(TARGET1) -f verilog-batch-auto
verilog:
	$(CC1) $(TARGET1) -o BancoPrueba
vvp:
	$(CC3) BancoPrueba


