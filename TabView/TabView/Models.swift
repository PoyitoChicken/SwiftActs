//
//  Models.swift
//  TabView
//
//  Created by Alumno on 13/03/24.
//

import Foundation

struct Resultado_API : Codable {
    var results : [Personaje]
}

struct Personaje : Codable, Identifiable {
    var id : Int
    var name : String
    var status : String
    var gender : String
    var image : String
    var species: String
    
    enum CodingKeys : String, CodingKey{
        case id
        case name
        case status
        case gender
        case image
        case species
    }
}

struct Photo : Identifiable, Codable {
    var id = UUID()
    var title: String
    var explanation: String
    var url: String
    
    enum CodingKeys : String, CodingKey{
        case title
        case explanation
        case url
    }
}


