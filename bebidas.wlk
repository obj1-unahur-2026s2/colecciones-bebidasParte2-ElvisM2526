object whisky {
  method rendimientoQueOtorga(dosisConsumida) = 0.9 ** dosisConsumida
}

object terere {
  method rendimientoQueOtorga(dosisConsumida) = 1.max(0.1 * dosisConsumida)
}

object cianuro {
  method rendimientoQueOtorga(dosisConsumida) = 0
}

//nuevas bebidas

object licuadoDeFrutas {
  const nutrientes = []

  method agregarNutriente(unNutriente) {
    nutrientes.add(unNutriente)
  }

  method rendimientoQueOtorga(dosisConsumida) {
    return nutrientes.sum()
  }
}

object aguaSaborizada {
  var bebidaBase = whisky

  method cambiarBebidaBase(unaBebida) {
    bebidaBase = unaBebida
  }

  method rendimientoQueOtorga(dosisConsumida) {
  const dosisBebidaBase = dosisConsumida * 0.25
  return 1 + bebidaBase.rendimientoQueOtorga(dosisBebidaBase)
  }
}

object coctel {
  const bebidas = []

  method agregarBebida(unaBebida) {
    bebidas.add(unaBebida)
  }

  method rendimientoQueOtorga(dosisConsumida) {
    if(bebidas.contains(cianuro)){
      return 0
    }
    
    const dosisProporcional = dosisConsumida / bebidas.size()
    return bebidas.fold(1, {acumulado, bebidas => 
    acumulado * bebidas.rendimientoQueOtorga(dosisProporcional)})
  }
}