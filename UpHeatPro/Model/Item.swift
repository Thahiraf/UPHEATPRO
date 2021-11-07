//
//  Item.swift
//  UpHeatPro
//
//  Created by Macbook on 04/11/2021.
//

import Foundation
struct Item: Identifiable{
    var id = UUID().uuidString
    var image: String
    var price: String
}
var items = [
    Item(image: "", price: "AED 160"),
    Item(image: "", price: "AED 120")
]
