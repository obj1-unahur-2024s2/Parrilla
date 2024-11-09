object cocina {
    const property platos = []
   method tieneBuenaOfertaVegetariana(){
        const cantidadPlatosCarnivoros = self.platosCarnivoros().size()
        const cantidadPlatosVegetarianos = self.platosVegetarianos().size()
        return (cantidadPlatosCarnivoros-cantidadPlatosVegetarianos).abs() <=2
   }

   method platoFuerteCarnivoro() = self.platosCarnivoros().max({p=>p.valoracion()})

   method platosCarnivoros() = platos.filter({p=>!p.esVegetariano()})
   method platosVegetarianos() = platos.filter({p=>p.esVegetariano()})
   method listaPlatosGustan(unaPersona) = platos.filter({p=> unaPersona.leAgrada(p)})
    method comensalesPolosOpuesto(unaPersona, otraPersona){
        return self.listaPlatosGustan(unaPersona).asSet().intersection(self.listaPlatosGustan(otraPersona).asSet()).isEmpty()
    }
    // method servirPlato(unaPersona) {
    //     if (self.listaPlatosGustan(unaPersona).isEmpty()){
    //         self.error("No le gusta ningun plato!!")
    //     }
    //     const unPlato = self.listaPlatosGustan(unaPersona).anyOne()
    //     unaPersona.comer(unPlato)
    //     platos.remove(unPlato)
    // }

   method servirPlato(unaPersona) {
        if (self.listaPlatosGustan(unaPersona).isEmpty()){
            self.error("No le gusta ningun plato!!")
        }
        const unPlato = unaPersona.eligePlato(self.listaPlatosGustan(unaPersona))
        unaPersona.comer(unPlato)
        platos.remove(unPlato)
    }
}  