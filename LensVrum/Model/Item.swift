//
//  Item.swift
//  LensVrum
//
//  Created by Saarthak Tuli on 03/12/22.
//

import SwiftUI


struct Item: Identifiable {
    var id = UUID().uuidString
    var title: String
    var subtitle: String
    var price: String
    var rating: String
    var image: String
}


// NOTE: Image and Color names are same...
var items = [
    Item(title: "Vincent Chase", subtitle: "Black Full Rim", price: "$36", rating: "3.8", image: "p1"),
    
    Item(title: "John Jacobs", subtitle: "Brown Tortoise", price: "$45", rating: "4.9", image: "p2"),

    Item(title: "Wood Black", subtitle: "Office Glasses", price: "$84", rating: "4.2", image: "p3"),

    Item(title: "Vu Abstact", subtitle: "Fashion U", price: "$65", rating: "3.5", image: "p4")
]
