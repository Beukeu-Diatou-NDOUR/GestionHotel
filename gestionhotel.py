import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk, Pango, Gdk


class HotelWindow(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self, title="Hôtel")

        header_bar = Gtk.HeaderBar()
        header_bar.set_show_close_button(True)
        header_bar.props.title = "Hôtel"
        self.set_titlebar(header_bar)

        rgba = Gdk.RGBA()
        rgba.parse('#D1E5F7')
        self.override_background_color(Gtk.StateFlags.NORMAL, rgba)

        # Bouton "Infos hôtel"
        info_button = Gtk.Button()
        info_button.set_image(Gtk.Image.new_from_icon_name("dialog-information", Gtk.IconSize.BUTTON))
        #info_button.connect("clicked", self.on_info_clicked)
        header_bar.pack_end(info_button)

        btn_modifier_infos = Gtk.Button(label="Infos de l'hôtel")
        header_bar.pack_start(btn_modifier_infos)
        btn_modifier_infos.connect("clicked", self.on_modifie_info_clicked)

        btn_modifier_tarifs = Gtk.Button(label="Modifier les tarifs par etat")
        header_bar.pack_start(btn_modifier_tarifs)
        btn_modifier_tarifs.connect("clicked", self.on_tarifs_etat)

        # Bouton "Réinitialiser l'hôtel"
        reset_button = Gtk.Button()
        reset_button.set_image(Gtk.Image.new_from_icon_name("edit-clear", Gtk.IconSize.BUTTON))
        reset_button.connect("clicked", self.on_reset_clicked)
        header_bar.pack_start(reset_button)

        # Bouton "Quitter"
        quit_button = Gtk.Button()
        quit_button.set_image(Gtk.Image.new_from_icon_name("application-exit", Gtk.IconSize.BUTTON))
        quit_button.connect("clicked", self.on_quit_clicked)
        header_bar.pack_end(quit_button)

        # Zone de contenu
        box = Gtk.Box(spacing=6)
        self.add(box)

        #INFORMATIONS DE L HOTEL
    def on_modifie_info_clicked(self, widget):
        # Créer les tableaux de formulaire
        infos = ["Nom Hotel", "Nombre d'etages", "Nombre de chambres" ,"Adresse", "Telephone"]
        cat_form = self.creates_form(infos)
        # Créer une grille pour positionner les éléments
        grid = Gtk.Grid(column_homogeneous=True, row_homogeneous=True, column_spacing=-20, row_spacing=-20)
        grid.attach(Gtk.Label(label="Modifier les Informations de l'hotel"), 0, 0, 1, 1)
        grid.attach(cat_form, 0, 1, 1, 1)
        # Créer un conteneur pour la grille et les boutons
        container = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)
        container.pack_start(grid, False, False, 0)
        # Ajouter les boutons enregistrer et annuler
        btn_enregistrer = Gtk.Button(label="Enregistrer")
        container.pack_end(btn_enregistrer, False, False, 0)
        # Supprimer le contenu précédent de la fenêtre
        child = self.get_child()
        if child is not None:
            self.remove(child)
        # Ajouter le conteneur à la fenêtre
        self.add(container)
        self.show_all()

    def creates_form(self, fields):
        form = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)
        for field in fields:
            label = Gtk.Label(label=field)
            entry = Gtk.Entry()
            form.pack_start(label, False, False, 0)
            form.pack_start(entry, False, False, 0)
        return form

    #POUR LES TARIFS PAR ETATS
    def on_tarifs_etat(self, widget):

        # Créer les tableaux de formulaire
        categories = ["Economie", "Speciale", "Affaire"]
        services = ["Petit déjeuner", "Téléphone", "Bar"]
        cat_form = self.create_form(categories, "Tarif normal", "Tarif spécial")
        serv_form = self.create_form(services, "Tarif", "")

        # Créer une grille pour positionner les éléments
        grid = Gtk.Grid(column_homogeneous=True, row_homogeneous=True, column_spacing=10, row_spacing=10)
        grid.attach(Gtk.Label(label="Tarifs par catégorie"), 0, 0, 1, 1)
        grid.attach(Gtk.Label(label="Tarifs par service"), 1, 0, 1, 1)
        grid.attach(cat_form, 0, 1, 1, 1)
        grid.attach(serv_form, 1, 1, 1, 1)

        # Créer un conteneur pour la grille et les boutons
        container = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)
        container.pack_start(grid, False, False, 0)

        # Ajouter les boutons enregistrer et annuler
        btn_enregistrer = Gtk.Button(label="Enregistrer")
        container.pack_end(btn_enregistrer, False, False, 0)

        # Supprimer le contenu précédent de la fenêtre
        child = self.get_child()
        if child is not None:
            self.remove(child)

        # Ajouter le conteneur à la fenêtre
        self.add(container)
        self.show_all()

    def create_form(self, fields, label1, label2):
        form = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)
        for field in fields:
            label = Gtk.Label(label=field)
            entry1 = Gtk.Entry()
            entry2 = Gtk.Entry()
            hbox = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
            hbox.pack_start(Gtk.Label(label=label1), False, False, 0)
            hbox.pack_start(entry1, False, False, 0)
            hbox.pack_start(Gtk.Label(label=label2), False, False, 0)
            hbox.pack_start(entry2, False, False, 0)
            form.pack_start(label, False, False, 0)
            form.pack_start(hbox, False, False, 0)
            entry1.connect("changed", self.on_entry_changed)
            entry2.connect("changed", self.on_entry_changed)
        return form

    #
    def on_entry_changed(self, entry):
        # vérifier si le contenu de l'entrée est un nombre
        try:
            float(entry.get_text())
        except ValueError:
            # si ce n'est pas un nombre, mettre la couleur de fond de l'entrée en rouge
            entry.override_background_color(Gtk.StateFlags.NORMAL, Gdk.RGBA(1.0, 0.0, 0.0, 1.0))
        else:
            # sinon, remettre la couleur de fond par défaut
            entry.override_background_color(Gtk.StateFlags.NORMAL, None)

    #POUR REINITIALISER
    def on_reset_clicked(self, widget):
        print("Réinitialiser l'hôtel")

    def on_quit_clicked(self, widget):
        Gtk.main_quit()

win = HotelWindow()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()
