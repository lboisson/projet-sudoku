require 'gtk3'
Dir[File.dirname(__FILE__) + '/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/../api/*.rb'].each {|file| require file }

class MethodeRes < WindowSudoku

	def initialize(invite)
		super("Méthodes de résolution")

		#Création des boutons
		@methode1 = Gtk::Button.new(:label =>"Chiffre caché", :use_underline => nil, :stock_id => nil)
		@methode2 = Gtk::Button.new(:label =>"Affichez les candidats", :use_underline => nil, :stock_id => nil)
		@methode3 = Gtk::Button.new(:label =>"Un seul candidat", :use_underline => nil, :stock_id => nil)
		@methode4 = Gtk::Button.new(:label =>"Intéraction entre régions", :use_underline => nil, :stock_id => nil)
		retour = Gtk::Button.new(:label => "Retourner au menu")

		#Création du label
		@label = Gtk::Label.new("")

		#Création de l'eventbox
		@imgEvent=Gtk::EventBox.new

		#Action des boutons
		@methode1.signal_connect "clicked" do |widget|
			loadMethode(1)
		end

		@methode2.signal_connect "clicked" do |widget|
			loadMethode(2)
		end

		@methode3.signal_connect "clicked" do |widget|
			loadMethode(3)
		end

		@methode4.signal_connect "clicked" do |widget|
			loadMethode(4)
		end

		retour.signal_connect "clicked" do |widget|
			hide
			if(invite==1)
				newWindow=Invite.new
			else
				newWindow=MenuProfil.new
			end
		end

		#Placement des boutons et ajout dans la table
		tableMain.attach(@methode1, 2, 8, 2, 3, Gtk::AttachOptions::EXPAND, Gtk::AttachOptions::EXPAND, 0,0)
		tableMain.attach(@methode2, 2, 8, 3, 4, Gtk::AttachOptions::EXPAND, Gtk::AttachOptions::EXPAND, 0,0)
		tableMain.attach(@methode3, 2, 8, 5, 6, Gtk::AttachOptions::EXPAND, Gtk::AttachOptions::EXPAND, 0,0)
		tableMain.attach(@methode4, 2, 8, 6, 7, Gtk::AttachOptions::EXPAND, Gtk::AttachOptions::EXPAND, 0,0)
		tableMain.attach(@label, 2, 8, 2, 4, Gtk::AttachOptions::EXPAND, Gtk::AttachOptions::EXPAND, 0,0)
		tableMain.attach(@imgEvent, 2, 8, 4, 7, Gtk::AttachOptions::EXPAND, Gtk::AttachOptions::EXPAND, 0,0)
		tableMain.attach(retour, 2, 8, 8, 9, Gtk::AttachOptions::EXPAND, Gtk::AttachOptions::EXPAND, 0,0)

		show_all
	end

	def loadMethode(n)
		if(@img!=nil)
				@imgEvent.remove(@img)
			end
		case n
		when 1
			@label.set_text("En regardant attentivement la grille, vous pouvez remarquer\n que le 8 ne peut être posé qu'à un seul endroit dans la région 6.")
			begin
				@img=Gtk::Image.new( :pixbuf => GdkPixbuf::Pixbuf.new(:file => "../../vues/hiddenSingle.png", :width => 100, :heigth => 100))
			rescue
				@img=Gtk::Image.new( :pixbuf => GdkPixbuf::Pixbuf.new(:file => "./vues/hiddenSingle.png", :width => 100, :heigth => 100))
			end

		when 2
			@label.set_text("Il serait pratique d'écrire tous les candidats d'une grille pour utiliser les méthodes suivantes.")
			begin
				@img=Gtk::Image.new( :pixbuf => GdkPixbuf::Pixbuf.new(:file => "../../vues/candidats.png", :width => 100, :heigth => 100))
			rescue
				@img=Gtk::Image.new( :pixbuf => GdkPixbuf::Pixbuf.new(:file => "./vues/candidats.png", :width => 100, :heigth => 100))
			end
		when 3
			@label.set_text("S'il n'y a qu'un seul candidat dans une case, alors c'est la solution.")
			begin
				@img=Gtk::Image.new( :pixbuf => GdkPixbuf::Pixbuf.new(:file => "../../vues/unSeulCandidat.png", :width => 100, :heigth => 100))
			rescue
				@img=Gtk::Image.new( :pixbuf => GdkPixbuf::Pixbuf.new(:file => "./vues/unSeulCandidat.png", :width => 100, :heigth => 100))
			end
		when 4
			@label.set_text("Si dans 2 régions alignées, l'on peut constater qu'un candidat n'est pas présent dans une ligne.\n C'est qu'il se trouve dans cette ligne dans la 3ème région.")
			begin
				@img=Gtk::Image.new( :pixbuf => GdkPixbuf::Pixbuf.new(:file => "../../vues/interactionRegion.png", :width => 100, :heigth => 100))
			rescue
				@img=Gtk::Image.new( :pixbuf => GdkPixbuf::Pixbuf.new(:file => "./vues/interactionRegion.png", :width => 100, :heigth => 100))
			end
		else
			return
		end
		@methodeActive = n

		@imgEvent.add(@img)
		@imgEvent.show_all

		@methode1.hide()
		@methode2.hide()
		@methode3.hide()
		@methode4.hide()
		@label.show()
		if (@backButton == nil)
			@backButton = Gtk::Button.new(:label =>"Retour", :use_underline => nil, :stock_id => nil)
			@backButton.signal_connect "clicked" do |widget|
				loadMenu()
			end
			@tableMain.attach(@backButton, 2,8 ,7,8, Gtk::AttachOptions::EXPAND, Gtk::AttachOptions::EXPAND, 0,0)
			@backButton.show()
		else
			@backButton.show()
		end
	end

	def loadMenu
		@imgEvent.hide
		@label.hide
		@backButton.hide
		@methode1.show
		@methode2.show
		@methode3.show
		@methode4.show
	end
end