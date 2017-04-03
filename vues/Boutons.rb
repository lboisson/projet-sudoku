require 'gtk3'
Dir[File.dirname(__FILE__) + '/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/../api/*.rb'].each {|file| require file }

class Boutons < Gtk::Box
	@grille
	@stylo
	@sousGrille


	def new(grille, sousGrille)
		initialize(grille, sousGrille)
	end

	def initialize(grille, sousGrille)
		super(:horizontal, 11)
		set_homogeneous(true)

		@grille = grille
		@sousGrille = sousGrille
		@stylo = true

		override_background_color(:normal, Gdk::RGBA::new(0.3,0.3,0.3,1.0))

		for i in 1..9
			btn = Gtk::Button.new(:label => i.to_s(), :use_underline => nil, :stock_id => nil)
			btn.signal_connect "clicked" do |widget|
				if (@stylo)
					@grille.setValeurSurFocus(widget.label.to_i)
					@grille.resetColorOnAll()
					@grille.setColorOnValue(widget.label, COUL_VERT)
					@sousGrille.loadAllCandidats()
				else
					@sousGrille.setCandidatSurFocus(widget.label.to_i)
				end

			end
			add(btn)
		end
		setCouleurBoutons("#4169E1")

		#quand le bouton "stylo" est clique, passe en mode "crayon", et inversement
		btn = Gtk::Button.new(:label => "Craie", :use_underline => nil, :stock_id => nil)
		setCouleurBoutons("#4169E1")
		btn.signal_connect "clicked" do |widget|
			if(!@stylo)
				widget.set_label("Craie")
				setCouleurBoutons("#4169E1")
				@stylo = true	

			else
				widget.set_label("Stylo")	
				setCouleurBoutons("#900090")
				@stylo = false
			end

		end

		add(btn)
	end
	
	# change couleur du focus
	def setCouleurSurFocus(couleur) 
		if (@focus)
			@focus.override_background_color(:normal, couleur)
		end
	end
	
	# change couleur du focus
	def resetCouleurSurFocus() 
		if (@focus)
			@focus.override_background_color(:normal, COUL_BLANC)
		end
	end

	# change couleur du focus
	def setCouleurBoutons(couleur) 
		for i in 2..10
			text = children()[children().size()-i].label
			children()[children().size()-i].children()[0].set_markup("<span foreground=\"#{couleur}\">#{text}</span>")
		end
	end

end