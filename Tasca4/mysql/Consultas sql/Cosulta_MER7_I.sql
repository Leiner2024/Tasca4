use MER7;
select Producto.Nom, Producto.Descripcion, Producto.IVA, Producto.Precio_de_Unidad
from Producto
where Producto.IVA = "10%";