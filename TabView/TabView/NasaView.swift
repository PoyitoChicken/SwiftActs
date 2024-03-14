//
//  NasaView.swift
//  TabView
//
//  Created by Alumno on 13/03/24.
//

import Foundation
import SwiftUI

struct FotoNasaDetail: View {
    @State var searchReq : String = ""
    var foto : Photo
    
    var body: some View {
        VStack{
            if (foto.title.contains(searchReq)) {
                Text(foto.title)
                    .foregroundColor(Color.yellow)
                AsyncImage(url: URL(string: foto.url))
                    .scaledToFit()
                    .frame(height: 200)
                    .clipped()
                
            }
            else {
                Text(foto.title)
                AsyncImage(url: URL(string: foto.url))
                    .scaledToFit()
                    .frame(height: 200)
                    .clipped()
                
            }
            Text(foto.explanation)

        }
    }
}

#Preview {
    FotoNasaDetail( searchReq: "", foto: Photo(title: "Foto", explanation: "Descripcion Foto", url: "https://apod.nasa.gov/apod/image/0211/leonid2002_sapp1.jpg"))
}
