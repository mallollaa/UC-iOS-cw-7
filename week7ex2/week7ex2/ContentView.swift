//
//  ContentView.swift
//  week7ex2
//
//  Created by Manal H R Alajmi  on 21/09/2022.
//

import SwiftUI
struct Castmember: Identifiable{
    let id = UUID()
    let name: String
    let imageName: String
}
struct MoviesInfo: Identifiable {
    
    let id = UUID()
    let title: String
    let imageName: String
    let cast: [Castmember]
}

struct ContentView: View {
    let movies = [
        MoviesInfo(title: "Up",
                  imageName: "up",
                  cast: [
                        Castmember(
                            name: "Carl Fredricksen",
                            imageName: "1"
                        ),
                        Castmember(
                            name: "Russell",
                            imageName: "rusell"
                        ),
                        Castmember(
                            name: "Carl Fredricksen",
                            imageName: "1"
                        ),
                        Castmember(
                            name: "Russell",
                            imageName: "rusell"
                        ),                ]
                  ),
        
        MoviesInfo(title: "Harry potter",
                   imageName: "harryPotter",
        cast: [
            Castmember(
                name: "daniel radcliffe",
                imageName: "2"
            ),
            Castmember(
                name: "Emma watson",
                imageName: "3"
            ),
            Castmember(
                name: "daniel radcliffe",
                imageName: "2"
            ),
            Castmember(
                name: "Emma watson",
                imageName: "3"
            ),                ]
                  ),
        MoviesInfo(title: "Intersteller", imageName: "interstellar",
        cast: [
            Castmember(
                name: "Matthew McConaughey",
                imageName: "Matthew"
            ),
            Castmember(
                name: "Anne Hathaway",
                imageName: "anne"
            ),
            Castmember(
                name: "Matthew McConaughey",
                imageName: "Matthew"
            ),
            Castmember(
                name: "Anne Hathaway",
                imageName: "anne"
            ),
            ]
      )
    ]
    
    var body: some View {
        
        NavigationView{
            List {
                ForEach(movies) { movie in
                    NavigationLink(destination:
                        MovieDetail(movie: movie)) {
                        MovieListItem(movie: movie)
                    }
                }
            }.navigationTitle("Movies")
                .accentColor(.white)
              
        }
        .accentColor(.white)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MovieListItem: View {
    let movie: MoviesInfo
    
    var body: some View {
        HStack{
            Image(movie.imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            
            Text(movie.title)
                .font(.title)
        }
    }
}

struct MovieDetail: View {
    let movie: MoviesInfo
    
    var body: some View {
        ZStack{
            Color.black
            
            Image(movie.imageName)
                .resizable()
                .opacity(0.5)
                .blur(radius: 10)
            VStack{
                Image(movie.imageName)
                    .resizable()
                    .frame(width: 180, height: 180)
                    .clipShape(Circle())
                    .padding(5)
                    .background(.white)
                    .clipShape(Circle())
                Text(movie.title)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.all, 60)
                Spacer()
                
                ScrollView(.horizontal) {
                HStack{
               
                    ForEach(movie.cast) { Castmember in
                        
                        VStack{
                            
                            Image(Castmember.imageName)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                
                            Text(Castmember.name)
                                .font(.title)
                                .foregroundColor(.white)
                            
                        }
                      }
                    
                  }
                }
            }
        }
       .ignoresSafeArea()
        
    }
}
