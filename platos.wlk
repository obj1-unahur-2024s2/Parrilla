class Plato {
  method peso()
  
  method esVegetariano()
  
  method valoracion()
  
  method esAbundante() = self.peso() > 250
}

class Provoleta inherits Plato {
  const property peso
  const property tieneEspecias
  const property esCompleta
  
  override method esVegetariano() = !esCompleta
  
  override method valoracion() = if (self.esEspecial()) 120 else 85
  
  method esEspecial() = (self.esAbundante() && tieneEspecias) || esCompleta
}

class Hamburguesa inherits Plato {
  const pan
  
  override method peso() = 250
  
  override method esVegetariano() = false
  
  override method valoracion() = 60 + pan.puntoQueOtorga()
}

object industrial {
  method puntoQueOtorga() = 0
}

object casero {
  method puntoQueOtorga() = 20
}

object masaMadre {
  method puntoQueOtorga() = 45
}

class Hamburguesasvegetariana inherits Hamburguesa {
  const legumbre
  
  override method esVegetariano() = true
  
  override method valoracion() = super() + (legumbre.length() * 2)
}

class Parrillada inherits Plato {
  const cantidadDeCortes
  
  override method peso() = 250 * cantidadDeCortes
  
  override method esVegetariano() = false
  
  override method valoracion() = if (cantidadDeCortes >= 6) {
    140
  } else {
    if (cantidadDeCortes.between(4, 5)) 100 else 70
  }
}