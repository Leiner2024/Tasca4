use MER4;
SELECT Cliente.Nom, Cliente.DNI, Cliente.Cognom, Polissa.Num_Polissa, Tipos_Polissa.Nom
FROM Cliente, Tipos_Polissa, Polissa
WHERE Cliente.DNI = Polissa.Cliente_DNI and Tipos_Polissa.ID = Polissa.Tipos_Polissa_ID and Tipos_Polissa.Nom = "Viaje";