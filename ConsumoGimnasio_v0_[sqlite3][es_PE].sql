/*
@description Gestión del Consumo de los Clientes en un Gimnasio
@author Luis Carrillo Gutiérrez
@date Febrero, 2020
@version 0.0.1
*/

DROP TABLE IF EXISTS [Cliente];
CREATE TABLE IF NOT EXISTS [Cliente]
( 
	[id] INTEGER UNSIGNED NOT NULL,
	[nombres] VARCHAR(64) NOT NULL,
	[apellidos] VARCHAR(64) NOT NULL,
	[fecha de nacimiento] DATE NOT NULL,
	PRIMARY KEY ([id])
) WITHOUT RowId;

DROP TABLE IF EXISTS [Producto Ofertado];
CREATE TABLE IF NOT EXISTS [Producto Ofertado]
(
	[id] INTEGER UNSIGNED NOT NULL,
	-- { aerobyc, dance, steps, spinning, spa, sauna, taibo, etc }
	[denominación] VARCHAR(128) NOT NULL,
	[descripión comercial] TEXT NOT NULL,
	PRIMARY KEY ([id])
) WITHOUT RowId;

-- [Cliente] --1:n--<Consumo>--1:m-- [Producto]
DROP TABLE IF EXISTS [Registro de Consumo];
CREATE TABLE IF NOT EXISTS [Registro de Consumo]
( 
	[id] INTEGER UNSIGNED NOT NULL,
	[id de cliente] INTEGER UNSIGNED NOT NULL REFERENCES [Cliente](id),
	[id del producto] INTEGER UNSIGNED NOT NULL REFERENCES [Producto Ofertado](id),
	
	[fecha de consumo] DATE NOT NULL, -- DEFAULT NOW
	[hora de entrada] TIME NOT NULL,
	[hora de salida] TIME NULL,

	-- {Cancelado/Libre/Promocional por invitacion/Promocional por horas acumuladas}
	[tipo de sesión] INTEGER UNSIGNED NOT NULL,
	PRIMARY KEY ([id])
) WITHOUT RowId;