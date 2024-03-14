//
//  Controller.swift
//  TabView
//
//  Created by Alumno on 13/03/24.
//

import Foundation
@Observable
class PhotoViewModel {
    var arrPhotos = [Photo]()
    var arrPersonajes = [Personaje]()
    
    init(){
        Task{
            do {
                try await getPhotoData()
                print("salio de funcion")
            }
            catch {
                print("error al cargar datos de la API")
            }
            
        }
        
    }
    
    func getPhotoData() async throws{
        
        //1. Obtener el objeto URL
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&count=10") else{
            print("invalid url")
            return
        }
        
        
        
        //2. preparar el Request a la pagina http con la URL
        let urlRequest = URLRequest(url: url)
        
        //3. Realizar la llama con URLSession
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print("error")
            return
        }
        
        //4. Decodificar la informacion de formato JSON
        let results = try JSONDecoder().decode([Photo].self, from: data)
        
        print(results)
        
        //5. utilizamos el thread principal para actualizar la variable de Photos.
        DispatchQueue.main.async{
            self.arrPhotos = results
        }
        
    }
    
    func getPersonajesData() async throws{
        
        //1. Obtener el objeto URL
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else{
            print("invalid url")
            return
        }
        
        
        
        //2. preparar el Request a la pagina http con la URL
        let urlRequest = URLRequest(url: url)
        
        //3. Realizar la llama con URLSession
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print("error")
            return
        }
        
        //4. Decodificar la informacion de formato JSON
        let results = try JSONDecoder().decode(Resultado_API.self, from: data)
        
        print(results)
        
        //5. utilizamos el thread principal para actualizar la variable de Photos.
        DispatchQueue.main.async{
            self.arrPersonajes = results.results
        }
        
    }
    
}
