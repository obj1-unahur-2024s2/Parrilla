import platos.*

class Comensal {
    var peso 
    const platos = []
    method leAgrada(unPlato)
    method comer(unPlato){
        platos.add(unPlato)
    }
    method estaSatisfecho() = self.pesoTotalPlatos() >= peso * 0.01
    method pesoTotalPlatos() = platos.sum({p=>p.peso()})
    method eligePlato(listaPlatos)
}

class Vegetariano inherits Comensal {
    override method leAgrada(unPlato) = unPlato.esVegetariano() && unPlato.valoracion() >= 85
    override method estaSatisfecho() = super() && self.platosNoAbundantes()
    method platosNoAbundantes() = platos.all({p=> !p.esAbundante()})
    override method eligePlato(listaPlatos) = listaPlatos.find({p=>!p.esAbundante()})

}

class HambrePopular inherits Comensal {
    override method leAgrada(unPlato) = unPlato.esAbundante()
    override method eligePlato(listaPlatos) = listaPlatos.max({p=>p.peso()})
}

class PaladarFino inherits Comensal{
    override method leAgrada(unPlato) = unPlato.peso().between(150, 300) && unPlato.valoracion() > 100
    override method estaSatisfecho() = super() && platos.size().even()
    override method eligePlato(listaPlatos){
        const ultimoPlato = platos.last()
        if (platos.isEmpty()){
            return listaPlatos.anyOne()
        }
        else if (ultimoPlato.esVegetariano()){
            return listaPlatos.find({p=>p.esVegetariano()})
        }else{
            return listaPlatos.find({p=>!p.esVegetariano()})
        }
    }
}