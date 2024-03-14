//
//  RickAndMorty.swift
//  TabView
//
//  Created by Alumno on 13/03/24.
//

import Foundation

import SwiftUI

struct RickAndMorty: View {
    @State var searchReq : String = ""
    @State var photoVM = PhotoViewModel()
    var body: some View {
        List(photoVM.arrPersonajes){ item in
            if ( item.name.contains(searchReq)){
                Text(item.name)
                    .foregroundColor(.yellow)
            } else {
                Text(item.name)
            }
            AsyncImage(url: URL(string: item.image))
        }
        .task{
            do{
                try await photoVM.getPersonajesData()
                
            } catch {
                print("Error al cargar los personajes")
            }
            
        }
        
    }
}

#Preview {
    RickAndMorty()
}
