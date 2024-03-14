//
//  Rows.swift
//  TabView
//
//  Created by Alumno on 13/03/24.
//

import SwiftUI

struct FotoNasaRow: View {
    var foto: Photo

    var body: some View {
        VStack{
            Text(foto.title)
            AsyncImage(url: URL(string: foto.url))
                .scaledToFit()
                .frame(height: 150)
                .clipped()
        }
    }
}

#Preview {
    FotoNasaRow( foto: Photo(title: "Foto", explanation: "Foto", url: "https://apod.nasa.gov/apod/image/2204/JupiterDarkSpot_JunoTT_1080.jpg"))
}
