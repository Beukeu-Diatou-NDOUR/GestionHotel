from tkinter import ttk
from tkinter import *
from tkinter import messagebox
import sqlite3

def ajouter():
    nom = entrernom.get()
    prenom = entrerPrenom.get()
    tel = entrerTel.get()
    num_chambre = entrerNum_chambre.get()
    date_entre = entrerDate_entre.get()

    # Creeon la connexion
    con = sqlite3.connect('hotel.db')
    cuser = con.cursor()
    cuser.execute("insert into client('nom','prenom','tel','num_chambre','date_reser') values (?,?,?,?,?)",(nom,prenom,tel,num_chambre,date_reser))
    con.commit()
    con.close()
    messagebox.showinfo("Client ajouté")
    # afficher
    con = sqlite3.connect('hotel.db')
    cuser = con.cursor()
    select = cuser.execute("select * from client order by code desc")
    select = list(select)
    table.insert('', END, values=select[0])
    con.close()

def modifier():
    nom = entrernom.get()
    prenom = entrerPrenom.get()
    tel = entrerTel.get()
    num_chambre = entrerNum_chambre.get()
    date_reser = entrerDate_reser.get()

    # Creeon la connexion
    con = sqlite3.connect('hotel.db')
    cuser = con.cursor()
    cuser.execute("update client set nom=?,prenom=?,tel=?,num_chambre=?,date_reser=?"
                  (nom, prenom, tel, num_chambre, date_entre, date_reser))
    con.commit()
    con.close()
    messagebox.showinfo("Client Modifier")
        # afficher
    con = sqlite3.connect('hotel.db')
    cuser = con.cursor()
    select = cuser.execute("select * from client order by code desc")
    select = list(select)
    table.insert('', END, values=select[0])
    con.close()

def supprimer():
    codeSelectionner = table.item(table.selection())['values'][0]
    con = sqlite3.connect("hotel.db")
    cuser = con.cursor()
    delete = cuser.execute("delete from client where code = {}".format(codeSelectionner))
    con.commit()
    table.delete(table.selection())

#titre general
root = Tk()
root.title("Gestion des clients ")
root.geometry("1300x700")
#Ajouter le titre
lbltitre = Label(root,bd = 20, relief = RIDGE, text="GESTION DES CLIENTS", font = ("Arial", 10), bg = "darkblue", fg="white")
lbltitre.place(x = 0, y = 0, width = 1200)
#Liste des patients
lblListePatient = Label(root, text="LISTES DES CLIENTS ", font=("Arial", 10), bg="darkblue", fg="white")
lblListePatient.place(x=600,y=100,width=560)
#text nom ---
lblnom = Label(root, text="Nom ", font = ("Arial", 10), bg = "black", fg="white")
lblnom.place(x=0,y=150,width=200)
entrernom = Entry(root)
entrernom.place(x=200,y=150,width=100,height=20)
#text prenom ----
lblPrenom = Label(root, text="Prenom ", font = ("Arial", 10), bg = "black", fg="white")
lblPrenom.place(x=0,y=200,width=200)
entrerPrenom = Entry(root)
entrerPrenom.place(x=200,y=200,width=100,height=20)
#num chambre ----
lblNum_chambre = Label(root, text="Numero Chambre", font = ("Arial", 10), bg = "black", fg="white")
lblNum_chambre.place(x=0,y=250,width=200)
entrerNum_chambre = Entry(root)
entrerNum_chambre.place(x=200,y=250,width=50,height=20)
#Telephone -----
lblTel = Label(root, text="Telephone", font = ("Arial", 10), bg = "black", fg="white")
lblTel.place(x=0,y=300,width=200)
entrerTel = Entry(root)
entrerTel.place(x=200,y=350,width=100,height=20)
#reservation ----------
lblDate_reser = Label(root, text="Date Reservation", font = ("Arial", 10), bg = "black", fg="white")
lblDate_reser.place(x=0,y=350,width=200)
entrerDate_reser = Entry(root)
entrerDate_reser.place(x=200,y=300,width="100",height=20)

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
table = ttk.Treeview(root, columns=(1, 2, 3, 4, 5), height=5, show="headings")
table.place(x=500,y=150, width=750, height=350)
#Entete
table.heading(1 , text="Nom")
table.heading(2 , text="PRENOM")
table.heading(3 , text="TEL")
table.heading(4 , text="NUM_CHAMBRE")
table.heading(5 , text="DATE_RESERV")

#definir les dimentions des colonnes
table.column(1,width=150)
table.column(2,width=150)
table.column(3,width=150)
table.column(4,width=150)
table.column(5,width=150)


# afficher les informations de la table
con =  sqlite3.connect('hotel.db')
cuser = con.cursor()
#select = cuser.execute("select * from patient")
#for row in select:
 #   table.insert('', END, value=row)
#con.close()

root.mainloop()