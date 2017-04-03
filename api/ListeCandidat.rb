class ListeCandidat
	# @tableauCandidat	

	private_class_method :new

	# Constructeur de la classe
	# @return : self
	def ListeCandidat.creer
		new
	end

	def initialize
		@tableauCandidat = Array.new(9)	
		return self
	end

	# Méthode pour ajouter un candidat
	# @param [Fixnum] symbole
	# @return : self	
	def add(symbole)
		@tableauCandidat.insert(symbole, symbole)
		# @tableauCandidat.uniq
		return self
	end

	# Méthode pour supprimer un candidat
	# @param [Fixnum] symbole
	# @return : self
	def remove(symbole)
		@tableauCandidat.delete(symbole)
		@tableauCandidat.insert(symbole, nil)
		return self
	end

	# Méthode qui retourne vrai si le candidat est présent
	# @param [Fixnum] symbole
	# @return : vrai ou faux
	def include?(symbole)
		return @tableauCandidat.include?(symbole)
	end

	# Méthode qui retourne le tableau des candidats
	# @return : [Fixnum] Array
	def getListeCandidat
		return @tableauCandidat
	end

	# Les méthodes de classe
	class << self
		
		# Méthode qui permet de placer un candidat sur une case
		# @param plateau plateau
		# @param position pos
		# @param [Fixnum] symbole
		# @return listeCandidat
		def placerCandidat(plateau, pos, symbole)
			listeCandidat = plateau.getCaseListeCandidat(pos)
			if listeCandidat == nil then
				listeCandidat = Candidat.creer
			end
			listeCandidat.add(symbole)
			plateau.setCaseListeCandidat(pos, listeCandidat)
			return listeCandidat
		end 

		# Méthode qui permet d'enlever un candidat d'une case
		# @param plateau plateau
		# @param position pos
		# @param [Fixnum] symbole
		# @return listeCandidat
		def retirerCandidat(plateau, pos, symbole)
			listeCandidat = plateau.getCaseListeCandidat(pos)
			if listeCandidat != nil then
				listeCandidat.remove(symbole)
				plateau.setCaseListeCandidat(pos, listeCandidat)
			end
			return listeCandidat
		end

	end
end

liste = ListeCandidat.creer()


