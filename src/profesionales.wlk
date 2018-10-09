// esta clase está completa, no necesita nada más
class Universidad {
	var honorarioSugerido
	var provincia
	var universidad
	
	method setHonorariosSugeridos(_honorarioSugerido) {
		honorarioSugerido = _honorarioSugerido
	}
	
	method universidad() { return universidad}
	method universidad(univ) { universidad = univ }
	method getProvincia() { return provincia }
	method getHonorariosSugeridos() { return honorarioSugerido }
}

class Profesional {
	
	var universidad
	
	method universidad() { return universidad}
	method universidad(univ) { universidad = univ }
	method provinciasDondePuedeTrabajar() { return #{} }
	
	method trabajasEn(_provincia) { return self.provinciasDondePuedeTrabajar().contains(_provincia) }
}


class ProfesionalAsociado inherits Profesional{
	
	override method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }
}


// a esta clase le faltan métodos
class ProfesionalVinculado inherits Profesional{
	method honorariosPorHora() { return #{universidad.getHonorariosSugeridos()} }
	override method provinciasDondePuedeTrabajar() { return #{universidad.getProvincia()} }
}


// a esta clase le faltan atributos y métodos
class ProfesionalLibre inherits Profesional {
	var honorarios
	var provincias = #{}
	
	method setHonorarios(_honorarios) { honorarios = _honorarios }
	method honorariosPorHora() { return honorarios }
	method addProvincias(_provincias) { provincias.addAll(_provincias) }
	override method provinciasDondePuedeTrabajar() { return provincias }
}
