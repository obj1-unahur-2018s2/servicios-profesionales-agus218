class Empresa {
	
	const profesionales = #{}
	var honorariosDeReferencia 
	
	method setHonorarioDeReferencia(_honorarioDeReferencia) {
		honorariosDeReferencia = _honorarioDeReferencia
	}
	method agregarProfesionales(_profesionales) {
		profesionales.addAll(_profesionales)
	}
	method agregarProfesional(_profesional) {
		profesionales.add(_profesional)
	}
	method profesionalesCaros() { 
		profesionales.filter({profesional => profesional.honorariosPorHora() > honorariosDeReferencia})
	}
	method universidadesFormadoras() { return 
		profesionales.map( {profesional => profesional.universidad()} )
	}
	method profesionalMasBarato() { return 
		profesionales.min( {profesional => profesional.honorariosPorHora()} )
	}
	method provinciaCubierta(_provincia) {
		return profesionales.any( { profesional => profesional.provinciaDondePuedeTrabajar().contains(_provincia) })
	}
	method profesionalesPorUniversidad(_universidad) {
		return profesionales.count({ profesional => profesional.universidad() == _universidad })
	}
	method profesionalPocoAtractivo(_profesional) {
		profesionales.provinciasDondePuedeTrabajar().all(
			{provincia => profesionales.any({
				profesional => profesional.provinciasDondePuedeTrabajar().contains(provincia)
				and profesional.honorariosPorHora() < _profesional.honorariosPorHora()
			})}
		)
	}
	
	method profesionalMasBaratoQue(_provincia,  _honorario) {
		return profesionales.any( { profesional => profesional.provinciasDondePuedeTrabajar().contains(_provincia)
			and profesional.honorariosPorHora() < _honorario }
		)
	}
	
	method profesionalPocoAtractivo2(_profesional) {
		return _profesional.provinciasDonePuedeTrabajar().all({
			provincia => self.profesionalMasBaratoQue(provincia, _profesional.honorariosPorHora())
		})
	}
	
}
