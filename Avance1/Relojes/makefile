CC = iverilog
TARGET0 = relojes.v
TARGET1 = resultados.vcd
TARGET2 = clocks
TARGET3 = BancoPruebas.v
TEMP0 = relojes_est.v
all:
	@echo "Sintetizando generador de relojes..."
	yosys -s sintesis_relojes.ys
	sed -i 's/relojes/relojes_est/' $(TEMP0)
	sed -i 's/out_c/out_e/g' $(TEMP0)

	@echo "Generador de relojes sintetizado..."
	
	@echo "Realizando auto-instanciación..."

	emacs --batch $(TARGET3) -f verilog-batch-auto

	@echo "Compilando Verilog"

	$(CC) -o $(TARGET2) $(TARGET3)
	vvp $(TARGET2) 

	@echo "Fin. Utilice <make wave> para generar onda del archivo. "

wave:
	gtkwave $(TARGET1)
help:
	@echo ""
	@echo "make: compila el código de icarus y enseña la tabla del código. "
	@echo "make wave: abre gtkwave."
	@echo "make clean: borra los archivos generados."
clean:
	rm -f BancoPruebas
	rm -f resultados.vcd
	rm -f $(TEMP0)

