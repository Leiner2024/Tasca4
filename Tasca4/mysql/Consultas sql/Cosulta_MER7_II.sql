USE MER7;
select Ticket.Num_Factura, Ticket.Data_Ticket, Empleado.Nom, Empleado.Cognom
from Ticket, Empleado, Linea_Ticket, Producto
where Producto.ID = Linea_Ticket.Producto_ID and Ticket.Num = Linea_Ticket.Ticket_Num and Empleado.ID = Ticket.Empleado_ID and Producto.Nom = "Shampoo";