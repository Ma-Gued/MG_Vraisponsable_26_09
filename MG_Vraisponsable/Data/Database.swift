//
//  Database.swift
//  MG_Vraisponsable
//
//  Created by apprenant43 on 19/09/2023.
//

import Foundation

//
//  Models.swift
//  MG_Vraisponsable
//
//  Created by apprenant43 on 19/09/2023.
//

import Foundation
import Combine
import UIKit
import MapKit


enum PlaceType : String {
    case restos = "Restos"
    case alim = "Alimentation"
    case ressou = "Ressourceries"
    case bars = "Bars"
    case magasins = "Magasins"
    case vetements = "Vêtements"
    case loisirs = "Loisirs"
    case all = ""
}

class Place : Identifiable, ObservableObject {
    var id = UUID()
    var name: String
    var localisation : CLLocationCoordinate2D
    var adresse : Adresse
    var telephone : String
    var liens : Liens
    var criteres : [Critere]
    @Published var userRatings: [Double]
    @Published var isFavorite: Bool

    init(name: String, localisation: CLLocationCoordinate2D, adresse: Adresse, telephone: String, liens: Liens, criteres: [Critere], userRatings: [Double] = [], isFavorite: Bool = false, photos: [String], comments : [Comment], type: PlaceType) {
        self.name = name
        self.localisation = localisation
        self.adresse = adresse
        self.telephone = telephone
        self.liens = liens
        self.criteres = criteres
        self.userRatings = userRatings
        self.isFavorite = isFavorite
        self.photos = photos
        self.comments = comments
        self.type = type
    }

    var userRating: Double {
        if userRatings.isEmpty{
            return 0.0
        }
        return userRatings.reduce(0,+) / Double(userRatings.count)
    }
    // Fonction pour ajouter une note utilisateur
    func addUserRating(rating: Double) {
        userRatings.append(rating)
    }

    var photos : [String]
    @Published var comments : [Comment] = []
    var type : PlaceType
}// class Place


struct Location {
    var latitude : Double
    var longitude : Double
}
struct Adresse {
    var numero : Int
    var complementAdresse : String
    var voie : String
    var codePostal : Int
    var commune : String
}

struct Liens {
    var instagram : URL?
    var facebook : URL?
    var google : URL?
    var site : URL?
}

struct Critere: Identifiable{
    var id = UUID()
    var name: String
    var isChecked: Bool
}

struct Comment: Identifiable {
    var id = UUID()
    var text: String
    var user: String
}




// Place 1 (Day by Day = Alimentation)

let location1 = CLLocationCoordinate2D(latitude: 50.626707, longitude: 3.047807)

let adresse1 = Adresse(numero: 384, complementAdresse: "", voie: "Rue Gambetta", codePostal: 59000, commune: "Lille")

let liens1 = Liens(
    instagram: URL(string : "https://www.instagram.com/daybyday_lille/"),
    facebook: URL(string : "https://fr-fr.facebook.com/daybydaylille/"),
    // google: <#T##URL#>, A REVOIR
    site : URL(string : "https://daybyday-shop.com/magasin/lille/")
    )


let criteres1 = [
    Critere(name: "Produits en Vrac", isChecked: true),
    Critere(name: "Produits Bio", isChecked: true),
    Critere(name: "Produits locaux", isChecked: false),
    Critere(name: "Produits neufs", isChecked: true),
    Critere(name: "Produits de seconde main", isChecked: false),
    Critere(name: "Produits \"Zéro Déchets\"", isChecked: true),
    Critere(name: "Matériaux et Matières responsables", isChecked: true),
    Critere(name: "Produits végétariens", isChecked: true),
    Critere(name: "Produits végétaliens", isChecked: true),
    Critere(name: "Chaîne de production transparente", isChecked: true),
    Critere(name: "Emballages réutilisables", isChecked: true),
    Critere(name: "Consignes", isChecked: true),
    Critere(name: "Management bienveillant et inclusif", isChecked: true),
    Critere(name: "Rémunération équitable", isChecked: true),
    Critere(name: "Eclairage éteint si fermeture", isChecked: true)
]



 var place1 = Place(
    name: "Day by Day",
    localisation : location1,
    adresse : adresse1,
    telephone : "03 20 07 62 93",
    liens : liens1,
    criteres: criteres1,
    photos : ["dbd1", "dbd2", "dbd3"],
    comments: [],
    type : PlaceType.alim
    )


// Place 2 (Nous Anti Gaspi = Alimentation)

let location2 = CLLocationCoordinate2D(latitude: 50.63082770900126, longitude: 3.058329201423571)

let adresse2 = Adresse(numero: 73, complementAdresse: "", voie: "Rue Gambetta", codePostal: 59000, commune: "Lille")

let liens2 = Liens(
    instagram: URL(string : "https://www.instagram.com/nousantigaspi/"),
    facebook: URL(string : "https://fr-fr.facebook.com/nousantigaspi"),
    // google: <#T##URL#>, A REVOIR
    site : URL(string : "https://nousantigaspi.com/magasins/")
    )


let criteres2 = [
    Critere(name: "Produits en Vrac", isChecked: true),
    Critere(name: "Produits Bio", isChecked: true),
    Critere(name: "Produits locaux", isChecked: true),
    Critere(name: "Produits neufs", isChecked: true),
    Critere(name: "Produits de seconde main", isChecked: false),
    Critere(name: "Produits \"Zéro Déchets\"", isChecked: true),
    Critere(name: "Matériaux et Matières responsables", isChecked: false),
    Critere(name: "Produits végétariens", isChecked: true),
    Critere(name: "Produits végétaliens", isChecked: true),
    Critere(name: "Chaîne de production transparente", isChecked: true),
    Critere(name: "Emballages réutilisables", isChecked: false),
    Critere(name: "Consignes", isChecked: false),
    Critere(name: "Management bienveillant et inclusif", isChecked: true),
    Critere(name: "Rémunération équitable", isChecked: true),
    Critere(name: "Eclairage éteint si fermeture", isChecked: true)
]



 var place2 = Place(
    name: "Nous : Anti Gaspi",
    localisation : location2,
    adresse : adresse2,
    telephone : "03 20 40 25 85",
    liens : liens2,
    criteres: criteres2,
    photos : ["nous1", "nous2", "nous3"],
    comments: [],
    type : PlaceType.alim
    )


// Place 3 (De Rode Koe = Resto)

let location3 = CLLocationCoordinate2D(latitude: 50.640744, longitude: 3.060025)

let adresse3 = Adresse(numero: 29, complementAdresse: "", voie: "Rue des 3 Molettes", codePostal: 59800, commune: "Lille")

let liens3 = Liens(
    instagram: URL(string : "https://www.instagram.com/"),
    facebook: URL(string : "https://fr-fr.facebook.com/restaurantderodekoe"),
    // google: <#T##URL#>, A REVOIR
    site : URL(string : "https://www.derodekoe.fr")
    )


let criteres3 = [
    Critere(name: "Produits Bio", isChecked: true),
    Critere(name: "Produits locaux", isChecked: true),
    Critere(name: "Matériaux et Matières responsables", isChecked: false),
    Critere(name: "Cuisine végétarienne", isChecked: true),
    Critere(name: "Cuisine végétalienne", isChecked: false),
    Critere(name: "Tri des déchets", isChecked: true),
    Critere(name: "Redistribution du surplus", isChecked: true),
    Critere(name: "Compost", isChecked: false),
    Critere(name: "Chaîne de production transparente", isChecked: true),
    Critere(name: "Mobilier et vaisselle de seconde main", isChecked: false),
    Critere(name: "Vaisselle réutilisable", isChecked: true),
    Critere(name: "Consignes", isChecked: true),
    Critere(name: "Management bienveillant et inclusif", isChecked: true),
    Critere(name: "Rémunération équitable", isChecked: true),
    Critere(name: "Eclairage éteint si fermeture", isChecked: true)
]


 var place3 = Place(
    name: "De Rode Koe",
    localisation : location3,
    adresse : adresse3,
    telephone : "03 20 40 25 85",
    liens : liens3,
    criteres: criteres3,
    photos : ["drk1", "drk2", "drk3"],
    comments: [],
    type : PlaceType.restos
    )



// Place 4 (Bon Chic Bonne FRIPE = Vêtements) -> A REPRENDRE

let location4 = CLLocationCoordinate2D(latitude: 50.628399, longitude: 3.0523962487570966)

let adresse4 = Adresse(numero: 234, complementAdresse: "", voie: "Rue Léon Gambetta", codePostal: 59000, commune: "Lille")

let liens4 = Liens(
    instagram: URL(string : "https://www.instagram.com/bonchicbonnefripe"),
    facebook: URL(string : "https://fr-fr.facebook.com/bonchicbonnefripe"),
    // google: <#T##URL#>, A REVOIR
    site : URL(string : "https://www.bonchicbonnefripe.fr")
    )


let criteres4 = [
    Critere(name: "Vêtements Neufs", isChecked: false),
    Critere(name: "Vêtements de seconde main", isChecked: true),
    Critere(name: "Fait en France", isChecked: false),
    Critere(name: "Fait en Europe", isChecked: false),
    Critere(name: "Matières durables et responsables", isChecked: false),
    Critere(name: "Tri des déchets", isChecked: true),
    Critere(name: "Redistribution du surplus", isChecked: true),
    Critere(name: "Chaîne de production transparente", isChecked: false),
    Critere(name: "Utilisation de teintures et produits chimiques", isChecked: true),
    Critere(name: "Management bienveillant et inclusif", isChecked: true),
    Critere(name: "Rémunération équitable", isChecked: true),
    Critere(name: "Eclairage éteint si fermeture", isChecked: true)
]


 var place4 = Place(
    name: "Bon Chic Bonne FRIPE",
    localisation : location4,
    adresse : adresse4,
    telephone : "",
    liens : liens4,
    criteres: criteres4,
    photos : ["bcbf1", "bcbf2", "bcbf3"],
    comments: [],
    type : PlaceType.vetements
    )

// Place 5 ( Le Café Citoyen = Bar)

let location5 = CLLocationCoordinate2D(latitude: 50.63394, longitude: 3.06443)

let adresse5 = Adresse(numero: 7, complementAdresse: "", voie: "Place du Vieux Marché aux chevaux", codePostal: 59000, commune: "Lille")

let liens5 = Liens(
    instagram: URL(string : ""),
    facebook: URL(string : "https://www.facebook.com/cafecitoyen/?locale=fr_FR"),
    // google: <#T##URL#>, A REVOIR
    site : URL(string : "https://cafecitoyen.org")
    )


let criteres5 = [
    Critere(name: "Produits Bio", isChecked: true),
    Critere(name: "Produits locaux", isChecked: true),
    Critere(name: "Matériaux et Matières responsables", isChecked: true),
    Critere(name: "Produits végétariens", isChecked: true),
    Critere(name: "Produits végétaliens", isChecked: true),
    Critere(name: "Chaîne de production transparente", isChecked: true),
    Critere(name: "Emballages réutilisables", isChecked: false),
    Critere(name: "Consignes", isChecked: true),
    Critere(name: "Management bienveillant et inclusif", isChecked: true),
    Critere(name: "Rémunération équitable", isChecked: true),
    Critere(name: "Eclairage éteint si fermeture", isChecked: true)
]



 var place5 = Place(
    name: "Le Café Citoyen",
    localisation : location5,
    adresse : adresse5,
    telephone : "03 20 13 15 73",
    liens : liens5,
    criteres: criteres5,
    photos : ["cc1", "cc2", "cc3"],
    comments: [],
    type : PlaceType.bars

    )


// Place 6 (Pickles = Resto)

let location6 = CLLocationCoordinate2D(latitude: 50.63655, longitude: 3.06590)

let adresse6 = Adresse(numero: 25, complementAdresse: "", voie: "rue Pierre Mauroy", codePostal: 59000, commune: "Lille")

let liens6 = Liens(
    instagram: URL(string : "https://www.instagram.com/pickles.lille/?hl=fr"),
    facebook: URL(string : "https://www.facebook.com/pauselille/?locale=fr_FR"),
    // google: <#T##URL#>, A REVOIR
    site : URL(string : "")
    )


let criteres6 = [
    Critere(name: "Produits Bio", isChecked: true),
    Critere(name: "Produits locaux", isChecked: true),
    Critere(name: "Matériaux et Matières responsables", isChecked: true),
    Critere(name: "Cuisine végétarienne", isChecked: true),
    Critere(name: "Cuisine végétalienne", isChecked: true),
    Critere(name: "Tri des déchets", isChecked: true),
    Critere(name: "Redistribution du surplus", isChecked: false),
    Critere(name: "Compost", isChecked: true),
    Critere(name: "Chaîne de production transparente", isChecked: true),
    Critere(name: "Mobilier et vaisselle de seconde main", isChecked: false),
    Critere(name: "Vaisselle réutilisable", isChecked: true),
    Critere(name: "Consignes", isChecked: true),
    Critere(name: "Management bienveillant et inclusif", isChecked: true),
    Critere(name: "Rémunération équitable", isChecked: true),
    Critere(name: "Eclairage éteint si fermeture", isChecked: true)
]


 var place6 = Place(
    name: "Pickles",
    localisation : location6,
    adresse : adresse6,
    telephone : "03 20 40 70 45",
    liens : liens6,
    criteres: criteres6,
    photos : ["p1", "p2"],
    comments: [],
    type : PlaceType.restos

    )


// Place 7 (El Market = Magasins)

let location7 = CLLocationCoordinate2D(latitude: 50.63047, longitude: 3.05561)

let adresse7 = Adresse(numero: 128, complementAdresse: "", voie: "rue Léon Gambetta", codePostal: 59000, commune: "Lille")

let liens7 = Liens(
    instagram: URL(string : "https://www.instagram.com/modames.officiel/?hl=fr"),
    facebook: URL(string : "https://www.facebook.com/modames.officiel/"),
    // google: <#T##URL#>, A REVOIR
    site : URL(string : "https://www.elmarket.fr/blog/le-blog-el-market-1")
    )


let criteres7 = [
    Critere(name: "Produits Bio", isChecked: true),
    Critere(name: "Produits locaux", isChecked: true),
    Critere(name: "Matériaux et Matières responsables", isChecked: true),
    Critere(name: "Tri des déchets", isChecked: true),
    Critere(name: "Redistribution du surplus", isChecked: true),
    Critere(name: "Maroquinerie", isChecked: true),
    Critere(name: "Bijouterie artisanales", isChecked: true),
    Critere(name: "Compost", isChecked: false),
    Critere(name: "Chaîne de production transparente", isChecked: true),
    Critere(name: "Mobilier et vaisselle de seconde main", isChecked: false),
    Critere(name: "Vaisselle réutilisable", isChecked: true),
    Critere(name: "Consignes", isChecked: true),
    Critere(name: "Management bienveillant et inclusif", isChecked: true),
    Critere(name: "Rémunération équitable", isChecked: true),
    Critere(name: "Eclairage éteint si fermeture", isChecked: true)
]


 var place7 = Place(
    name: "El Market",
    localisation : location7,
    adresse : adresse7,
    telephone : "03 20 50 30 72",
    liens : liens7,
    criteres: criteres7,
    photos : ["em1", "em2", "em3"],
    comments: [],
    type : PlaceType.magasins
    )


// Place 8 (Les Prés du Hem = loisirs)

let location8 = CLLocationCoordinate2D(latitude: 50.69604, longitude: 2.86623)

let adresse8 = Adresse(numero: 150, complementAdresse: "", voie: "rue des Résistants", codePostal: 59280, commune: "Armentières")

let liens8 = Liens(
    instagram: URL(string : ""),
    facebook: URL(string : "https://www.facebook.com/presduhem/?locale=fr_FR"),
    // google: <#T##URL#>, A REVOIR
    site : URL(string : "https://enm.lillemetropole.fr/parcs/les-pres-du-hem")
    )


let criteres8 = [
    Critere(name: "Produits Bio", isChecked: true),
    Critere(name: "Produits locaux", isChecked: true),
    Critere(name: "Matériaux et Matières responsables", isChecked: false),
    Critere(name: "Tri des déchets", isChecked: false),
    Critere(name: "Redistribution du surplus", isChecked: false),
    Critere(name: "Compost", isChecked: false),
    Critere(name: "Chaîne de production transparente", isChecked: false),
    Critere(name: "Management bienveillant et inclusif", isChecked: true),
    Critere(name: "Rémunération équitable", isChecked: true),
    Critere(name: "Espaces verts", isChecked: true),
    Critere(name: "Detente familiale", isChecked: true),
    Critere(name: "Espace jeux", isChecked: true),
    Critere(name: "Cuisine végétarienne", isChecked: true),
    Critere(name: "Cuisine végétalienne", isChecked: false),
    Critere(name: "Estaminet", isChecked: true),
    Critere(name: "Foods trucks", isChecked: true),
    Critere(name: "Barbecue à disposition", isChecked: true),
    Critere(name: "Piscine et  jeux aquatiques enfants surveillés", isChecked: true),
    Critere(name: "Accrobranche", isChecked: true),
    Critere(name: "Pédalo", isChecked: true),
    Critere(name: "Voilier", isChecked: true),
    Critere(name: "Balade en barque", isChecked: true),
    Critere(name: "Ferme pédagogique", isChecked: true),
    Critere(name: "Ile ornithologique", isChecked: true)]


 var place8 = Place(
    name: "Les prés du Hem",
    localisation : location8,
    adresse : adresse8,
    telephone : "03 20 63 11 27",
    liens : liens8,
    criteres: criteres8,
    photos : ["ph1", "ph2", "ph3"],
    comments: [],
    type : PlaceType.loisirs
    )


// Place 9 (Oh my cream ! = magasin)

let location9 = CLLocationCoordinate2D(latitude: 50.63967, longitude: 3.06208)

let adresse9 = Adresse(numero: 4, complementAdresse: "", voie: "Rue Bartholomé Masurel", codePostal: 59800, commune: "Lille")

let liens9 = Liens(
    instagram: URL(string : "https://www.instagram.com/ohmycream/"),
    facebook: URL(string : "https://www.facebook.com/ohmycream"),
    // google: <#T##URL#>, A REVOIR
    site : URL(string : "https://www.ohmycream.com")
    )


let criteres9 = [
    Critere(name: "Produits en Vrac", isChecked: true),
    Critere(name: "Produits Bio", isChecked: true),
    Critere(name: "Produits locaux", isChecked: false),
    Critere(name: "Produits neufs", isChecked: true),
    Critere(name: "Produits de seconde main", isChecked: false),
    Critere(name: "Produits \"Zéro Déchets\"", isChecked: true),
    Critere(name: "Matériaux et Matières responsables", isChecked: true),
    Critere(name: "Produits végétariens", isChecked: true),
    Critere(name: "Produits végétaliens", isChecked: true),
    Critere(name: "Produits non testés sur les animaux", isChecked: true),
    Critere(name: "Chaîne de production transparente", isChecked: true),
    Critere(name: "Emballages réutilisables", isChecked: true),
    Critere(name: "Consignes", isChecked: false),
    Critere(name: "Management bienveillant et inclusif", isChecked: true),
    Critere(name: "Rémunération équitable", isChecked: true),
    Critere(name: "Eclairage éteint si fermeture", isChecked: true)
]



 var place9 = Place(
    name: "Oh my Cream !",
    localisation : location9,
    adresse : adresse9,
    telephone : "03 20 07 62 93",
    liens : liens9,
    criteres: criteres9,
    photos : ["omc1", "omc2", "omc3"],
    comments: [],
    type : PlaceType.magasins
    )

//Place 10 (La Ferme Urbaine = Loisirs)

let location10 = CLLocationCoordinate2D(latitude: 50.62768, longitude: 3.07187)

let adresse10 = Adresse(numero: 17, complementAdresse: "", voie: "Boulevard Jean-Baptiste Lebas", codePostal: 59000, commune: "Lille")

let liens10 = Liens(
    instagram: URL(string : ""),
    facebook: URL(string : ""),
    // google: <#T##URL#>, A REVOIR
    site : URL(string : "https://garesaintsauveur.lille3000.com/ferme-urbaine")
    )


let criteres10 = [
    Critere(name: "Produits en Vrac", isChecked: true),
    Critere(name: "Produits Bio", isChecked: true),
    Critere(name: "Produits locaux", isChecked: true),
    Critere(name: "Produits neufs", isChecked: true),
    Critere(name: "Produits de seconde main", isChecked: false),
    Critere(name: "Produits \"Zéro Déchets\"", isChecked: true),
    Critere(name: "Matériaux et Matières responsables", isChecked: true),
    Critere(name: "Produits végétariens", isChecked: true),
    Critere(name: "Produits végétaliens", isChecked: true),
    Critere(name: "Chaîne de production transparente", isChecked: true),
    Critere(name: "Emballages réutilisables", isChecked: true),
    Critere(name: "Consignes", isChecked: false),
    Critere(name: "Management bienveillant et inclusif", isChecked: true),
    Critere(name: "Rémunération équitable", isChecked: true),
    Critere(name: "Eclairage éteint si fermeture", isChecked: true),
    Critere(name: "Atelier jardinage junior et senior", isChecked: true),
    Critere(name: "Animaux", isChecked: true),
    Critere(name: "Ferme pédagogique", isChecked: true),
    Critere(name: "Atelier jardinage enfants", isChecked: true)
]



 var place10 = Place(
    name: "La Ferme Urbaine",
    localisation : location10,
    adresse : adresse10,
    telephone : "",
    liens : liens10,
    criteres: criteres10,
    photos : ["fu1", "fu2", "fu3"],
    comments: [],
    type: PlaceType.loisirs
    )


// Place 11 (Coco-friendly = Vêtements)

let location11 = CLLocationCoordinate2D(latitude: 50.63585, longitude: 3.06374)

let adresse11 = Adresse(numero: 9, complementAdresse: "", voie: "Rue de la Vieille Comédie", codePostal: 59800, commune: "Lille")

let liens11 = Liens(
    instagram: URL(string : "https://www.instagram.com/coco_friendly/?hl=fr"),
    facebook: URL(string : "https://www.facebook.com/cocofriendlylille/"),
    // google: <#T##URL#>, A REVOIR
    site : URL(string : "https://coco-friendly.com/fr/")
    )


let criteres11 = [
    Critere(name: "Vêtements Neufs", isChecked: true),
    Critere(name: "Vêtements de seconde main", isChecked: false),
    Critere(name: "Fait en France", isChecked: false),
    Critere(name: "Fait en Europe", isChecked: true),
    Critere(name: "Matières durables et responsables", isChecked: true),
    Critere(name: "Redistribution du surplus", isChecked: false),
    Critere(name: "Chaîne de production transparente", isChecked: true),
    Critere(name: "Utilisation de teintures et produits chimiques", isChecked: true),
    Critere(name: "Management bienveillant et inclusif", isChecked: true),
    Critere(name: "Rémunération équitable", isChecked: true),
    Critere(name: "Eclairage éteint si fermeture", isChecked: true)
]


 var place11 = Place(
    name: "Coco-Friendly",
    localisation : location11,
    adresse : adresse11,
    telephone : "03 20 52 32 43",
    liens : liens11,
    criteres: criteres11,
    photos : ["cf1", "cf2", "cf3"],
    comments: [],
    type : PlaceType.vetements

    )

// Place 13 (Les Récoupettes = ressourcerie)

let location13 = CLLocationCoordinate2D(latitude: 50.64952, longitude: 3.06119)

let adresse13 = Adresse(numero: 64, complementAdresse: "", voie: "Rue Edouard Delesalle", codePostal: 59800, commune: "Lille")

let liens13 = Liens(
    instagram: URL(string : ""),
    facebook: URL(string : ""),
    // google: <#T##URL#>, A REVOIR
    site : URL(string : "https://www.lesrecoupettes.fr/page/473327-contact-et-infos")
    )


let criteres13 = [
    Critere(name: "Produits neufs", isChecked: false),
    Critere(name: "Produits de seconde main", isChecked: true),
    Critere(name: "Produits locaux", isChecked: false),
    Critere(name: "Matériaux et Matières responsables", isChecked: true),
    Critere(name: "Tri des déchets", isChecked: false),
    Critere(name: "Redistribution du surplus", isChecked: false),
    Critere(name: "Chaîne de production transparente", isChecked: true),
    Critere(name: "Mobilier et vaisselle de seconde main", isChecked: true),
    Critere(name: "Management bienveillant et inclusif", isChecked: true),
    Critere(name: "Rémunération équitable", isChecked: true),
    Critere(name: "Eclairage éteint si fermeture", isChecked: true),
    Critere(name: "Atelier de formation en artisanat", isChecked: true)
]


 var place13 = Place(
    name: "Les Récoupettes",
    localisation : location13,
    adresse : adresse13,
    telephone : "06 67 53 76 17",
    liens : liens13,
    criteres: criteres13,
    photos : ["lr1", "lr2", "lr3"],
    comments: [],
    type : PlaceType.ressou

    )


// Place 14 (abej SOLIDARITÉ - Ressourcerie)

let location14 = CLLocationCoordinate2D(latitude: 50.66992, longitude: 3.14358)

let adresse14 = Adresse(numero: 220, complementAdresse: "", voie: "Rue Jean Jaurès", codePostal: 59491, commune: "Villeneuve d'Ascq")

let liens14 = Liens(
instagram: URL(string : "https://www.instagram.com/abejressourcerie/"),
facebook: URL(string : "https://www.facebook.com/abejressourcerielille/?locale=fr_FR"),
// google: <#T##URL#>, A REVOIR
site : URL(string : "https://abej-solidarite.fr")
)


let criteres14 = [
Critere(name: "Vêtements Neufs", isChecked: false),
Critere(name: "Vêtements de seconde main", isChecked: true),
Critere(name: "Produits Bio", isChecked: false),
Critere(name: "Produits locaux", isChecked: false),
Critere(name: "Fait en France", isChecked: false),
Critere(name: "Fait en Europe", isChecked: false),
Critere(name: "Matériaux et Matières responsables", isChecked: false),
Critere(name: "Tri des déchets", isChecked: false),
Critere(name: "Redistribution du surplus", isChecked: true),
Critere(name: "Chaîne de production transparente", isChecked: true),
Critere(name: "Management bienveillant et inclusif", isChecked: true),
Critere(name: "Rémunération équitable", isChecked: true),
Critere(name: "Eclairage éteint si fermeture", isChecked: true)
]


var place14 = Place(
name: "La Ressoucerie de l'ABEJ",
localisation : location14,
adresse : adresse14,
telephone : "03 66 19 10 00",
liens : liens14,
criteres: criteres14,
photos : ["as1", "as2", "as3"],
comments: [],
type : PlaceType.ressou

)



var places = [place1, place2, place3, place4, place5, place6, place7, place8, place9, place10, place11, place13, place14]
