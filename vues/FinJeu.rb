require 'gtk3'

class FinJeu < Gtk::Window

	def initialize
		super

		# signal_connect "destroy" do
		# 	Gtk.main_quit
		# end

		set_title "Fin du jeu"
		set_window_position(Gtk::Window::POS_CENTER)
		set_resizable(false)

		#Taille de la fenêtre, correspondant à celle du jeu.
		set_default_size(919, 602)

		#Création du label
		msgLabel = Gtk::Label.new("FIN DU JEU!!!!!!!! BRAVO MORRAY!!!!!")


		#Création de la table contenant les boutons
		tableMain = Gtk::Table.new(10, 10)


		#Placement des boutons et ajout dans la table
		tableMain.attach(msgLabel, 4, 6, 4, 6, Gtk::AttachOptions::EXPAND, Gtk::AttachOptions::EXPAND, 0,0)

		add(tableMain)

		show_all
	end
end