use MER5;
SELECT Cliente.Nom, Vehiculo.Marca, Tipo_de_Vehiculo.Nom, Cita.Data, Cita.Lugar, Cliente_Vehiculo.Data_ultima_revision
FROM Cliente, Vehiculo, Tipo_de_Vehiculo, Cita, Cliente_Vehiculo
WHERE Cliente.DNI = Cliente_Vehiculo.Cliente_DNI AND 
	Vehiculo.Num_bastidor = Cliente_Vehiculo.Vehiculo_Num_bastidor AND
	Tipo_de_Vehiculo.ID = Vehiculo.Tipo_de_Vehiculo_ID AND
	Cliente_Vehiculo.ID = Cita.Cliente_Vehiculo_ID and
	Cita.Data > "2022-03-10";