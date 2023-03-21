from tkinter import ttk
from tkinter import *
from tkinter import messagebox
import sqlite3


def ajouter():
    nom = entrernom.get()
    prenom = entrerPrenom.get()
    num_chambre = entrerNum_chambre.get()


    # Creeon la connexion
    con = sqlite3.connect('hotel.db')
    cuser = con.cursor()
    cuser.execute("insert into client('nom','prenom','num_chambre') values (?,?,?,?)",(nom,prenom,num_chambre))
    con.commit()
    con.close()
    messagebox.showinfo("Chambre ajouté")
    # afficher
    con = sqlite3.connect('hotel.db')
    cuser = con.cursor()
    select = cuser.execute("select * from chambre order by code desc")
    select = list(select)
    table.insert('', END, values=select[0])
    con.close()

def modifier():
    nom = entrernom.get()
    prenom = entrerPrenom.get()
    tel = entrerTel.get()
    num_chambre = entrerNum_chambre.get()
    date_entre = entrerDate_entre.get()

    # Creeon la connexion
    con = sqlite3.connect('hotel.db')
    cuser = con.cursor()
    cuser.execute("update client set nom=?,prenom=?,num_chambre=?"
                  (nom, prenom, num_chambre))
    con.commit()
    con.close()
    messagebox.showinfo("Chambre créée")
        # afficher
    con = sqlite3.connect('hotel.db')
    cuser = con.cursor()
    select = cuser.execute("select * from chambre order by code desc")
    select = list(select)
    table.insert('', END, values=select[0])
    con.close()

def supprimer():
    codeSelectionner = table.item(table.selection())['values'][0]
    con = sqlite3.connect("hotel.db")
    cuser = con.cursor()
    delete = cuser.execute("delete from chambre where code = {}".format(codeSelectionner))
    con.commit()
    table.delete(table.selection())

#titre general
root = Tk()
root.title("Gestion des chambres ")
root.geometry("1300x700")
#Ajouter le titre
lbltitre = Label(root,bd = 20, relief = RIDGE, text="GESTIONS DES CHAMBRES", font = ("Arial", 10), bg = "darkblue", fg="white")
lbltitre.place(x = 0, y = 0, width = 1200)
#Liste des patients
lblListePatient = Label(root, text="LISTES DES CHAMBRES ", font=("Arial", 10), bg="darkblue", fg="white")
lblListePatient.place(x=600,y=100,width=560)
#text nom ---
lblnom = Label(root, text="NUMERO ", font = ("Arial", 10), bg = "black", fg="white")
lblnom.place(x=0,y=150,width=200)
entrernom = Entry(root)
entrernom.place(x=200,y=150,width=100,height=20)
#text prenom ----
lblPrenom = Label(root, text="CLASSE", font = ("Arial", 10), bg = "black", fg="white")
lblPrenom.place(x=0,y=200,width=200)
entrerPrenom = Entry(root)
entrerPrenom.place(x=200,y=200,width=100,height=20)
#num chambre ----
lblNum_chambre = Label(root, text="ETAT", font = ("Arial", 10), bg = "black", fg="white")
lblNum_chambre.place(x=0,y=250,width=200)
entrerNum_chambre = Entry(root)
entrerNum_chambre.place(x=200,y=250,width=50,height=20)


#Enregistrer
btnenregistrer = Button(root, text="Enregistrer", font=("Arial", 16),bg="darkblue", fg="yellow", command=ajouter)
btnenregistrer.place(x=30, y=450, width=200)

#modifier
btnmodofier = Button(root, text="Modifier", font=("Arial", 16),bg="darkblue", fg="yellow", command=modifier)
btnmodofier.place(x=270, y=450, width=200)

#Supprimer
btnSupprimer = Button(root, text="Supprimer", font=("Arial", 16),bg="darkblue", fg="yellow", command=supprimer)
btnSupprimer.place(x=150, y=500, width=200)

#Table
table = ttk.Treeview(root, columns=(1, 2, 3), height=5, show="headings")
table.place(x=500,y=150, width=750, height=350)
#Entete
table.heading(1 , text="Numero")
table.heading(2 , text="Classe")
table.heading(3 , text="Etat")

#definir les dimentions des colonnes
table.column(1,width=150)
table.column(2,width=150)
table.column(3,width=150)

# afficher les informations de la table
con =  sqlite3.connect('hotel.db')
cuser = con.cursor()
#select = cuser.execute("select * from patient")
#for row in select:
 #   table.insert('', END, value=row)
#con.close()

root.mainloop()