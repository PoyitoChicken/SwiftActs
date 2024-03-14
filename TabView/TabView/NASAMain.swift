//
//  NASAMain.swift
//  TabView
//
//  Created by Alumno on 13/03/24.
//

import Foundation
import SwiftUI

struct FotosView: View {
    @State var searchReq : String = ""
    @State var PhotoVM = PhotoViewModel()
    
    var body: some View {
        NavigationStack{
            List(PhotoVM.arrPhotos) { item in
                NavigationLink {
                    FotoNasaDetail(foto: item)
                } label: {
                    FotoNasaRow(foto: item)
                }
            }
            .task{
                do {
                    try await PhotoVM.getPhotoData()
                } catch {
                    print("Error", error)
                }
            }
            
        }
        
        
        
    }
}

#Preview {
    FotosView()
}
