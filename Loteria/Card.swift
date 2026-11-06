//
//  ContentView.Card.swift
//  Loteria
//
//  Created by Esteban Arrioja on 11/5/26.
//

import Foundation


struct Card: Identifiable, Hashable {
    let name: String
    var emoji: String = ""
    var id: String { name }
}

extension Card {
    static let all: [Card] = [
        Card(name: "El Gallo"),
        Card(name: "El Diablito"),
        Card(name: "La Dama"),
        Card(name: "El Catrín"),
        Card(name: "El Paraguas"),
        Card(name: "La Sirena"),
        Card(name: "La Escalera"),
        Card(name: "La Botella"),
        Card(name: "El Barril"),
        Card(name: "El Árbol"),
        Card(name: "El Melón"),
        Card(name: "El Valiente"),
        Card(name: "El Gorrito"),
        Card(name: "La Muerte"),
        Card(name: "La Pera"),
        Card(name: "La Bandera"),
        Card(name: "El Bandolón"),
        Card(name: "El Violoncello"),
        Card(name: "La Garza"),
        Card(name: "El Pájaro"),
        Card(name: "La Mano"),
        Card(name: "La Bota"),
        Card(name: "La Luna"),
        Card(name: "El Cotorro"),
        Card(name: "El Borracho"),
        Card(name: "El Negrito"),
        Card(name: "El Corazón"),
        Card(name: "La Sandía"),
        Card(name: "El Tambor"),
        Card(name: "El Camarón"),
        Card(name: "Las Jaras"),
        Card(name: "El Músico"),
        Card(name: "La Araña"),
        Card(name: "El Soldado"),
        Card(name: "La Estrella"),
        Card(name: "El Cazo"),
        Card(name: "El Mundo"),
        Card(name: "El Apache"),
        Card(name: "El Nopal"),
        Card(name: "El Alacrán"),
        Card(name: "La Rosa"),
        Card(name: "La Calavera"),
        Card(name: "La Campana"),
        Card(name: "El Cantarito"),
        Card(name: "El Venado"),
        Card(name: "El Sol"),
        Card(name: "La Corona"),
        Card(name: "La Chalupa"),
        Card(name: "El Pino"),
        Card(name: "El Pescado"),
        Card(name: "La Palma"),
        Card(name: "La Maceta"),
        Card(name: "El Arpa"),
        Card(name: "La Rana"),
    ]
}
