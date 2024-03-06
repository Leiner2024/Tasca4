use MER4;
SELECT Cliente.Nom, Cliente.Cognom, Cliente.Direccion, Polissa.Num_Polissa as "Número de Polissa"
FROM Cliente, Polissa
WHERE Cliente.DNI = Polissa.Cliente_DNI and Cliente.Nom = "Ayoub";