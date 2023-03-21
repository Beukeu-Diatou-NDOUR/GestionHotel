import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk, Gdk
import os

class MenuWindow(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self, title="Menu")
        self.set_border_width(10)

        box = Gtk.Box()
        box.set_halign(Gtk.Align.CENTER)
        box.set_valign(Gtk.Align.CENTER)
        self.add(box)

        rgba = Gdk.RGBA()
        rgba.parse('#D1E5F7')
        self.override_background_color(Gtk.StateFlags.NORMAL, rgba)

        grid = Gtk.Grid()
        grid.set_column_spacing(100)
        grid.set_row_spacing(100)
        box.pack_start(grid, True, True, 0)

        Hotel_button = Gtk.Button(label="Gestion de l'hotel")
        Hotel_button.set_size_request(400, 100)
        grid.attach(Hotel_button, 0, 0, 1, 1)

        Chambres_button = Gtk.Button(label="Gestion des chambres")
        grid.attach(Chambres_button, 1, 0, 1, 1)
        Chambres_button.set_size_request(400, 100)

        Clients_button = Gtk.Button(label="Gestion des clients")
        grid.attach(Clients_button, 2, 0, 1, 1)
        Clients_button.set_size_request(400, 100)

        Reservations_button = Gtk.Button(label="Gestion des reservations")
        Reservations_button.set_size_request(100, 100)
        grid.attach(Reservations_button, 0, 1, 1, 1)

        Factures_button = Gtk.Button(label="Gestion des factures")
        grid.attach(Factures_button, 1, 1, 1, 1)

        Statistiques_button = Gtk.Button(label="Statistiques")
        grid.attach(Statistiques_button, 2, 1, 1, 1)

        grid.set_size_request(600, 100)

        Hotel_button.connect("clicked", self.ouvrir_gestion_hotel)
        Chambres_button.connect("clicked", self.ouvrir_gestion_chambres)
        Clients_button.connect("clicked", self.ouvrir_gestion_clients)
        Reservations_button.connect("clicked", self.ouvrir_gestion_reservations)
        Factures_button.connect("clicked", self.ouvrir_gestion_factures)

    def ouvrir_gestion_hotel(self, widget):
        os.system('python3 gestionhotel.py')
    def ouvrir_gestion_chambres(self, widget):
        os.system('python3 chambres.py')
    def ouvrir_gestion_clients(self, widget):
        os.system('python3 clients.py')
    def ouvrir_gestion_reservations(self, widget):
        os.system('python3 reservations.py')
    def ouvrir_gestion_factures(self, widget):
        os.system('python3 factures.py')


window = MenuWindow()
window.connect("destroy", Gtk.main_quit)
window.show_all()
Gtk.main()



