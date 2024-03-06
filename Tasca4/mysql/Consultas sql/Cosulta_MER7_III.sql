USE MER7;
Select count(Linea_Ticket.ID)
from Linea_Ticket, Ticket, Empleado
where Ticket.Num = Linea_Ticket.Ticket_Num and Empleado.ID = Ticket.Empleado_ID and Empleado.Nom like "0%";