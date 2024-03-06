use MER4;
SELECT Cliente.Nom, Cliente.Cognom, Venedor.Nom, Polissa.Num_Polissa, Tipos_Polissa.Nom
FROM Venedor, Cliente, Tipos_Polissa, Polissa
WHERE Cliente.DNI = Polissa.Cliente_DNI and Cliente.Nom = "Ayoub";