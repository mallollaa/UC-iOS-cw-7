//
//  ContentView.swift
//  week7classwork
//
//  Created by Manal H R Alajmi  on 21/09/2022.
//

import SwiftUI


struct movieCast:  Identifiable{
    let id = UUID()
    let movieName: String
    let imageName: String
}

struct movie: Identifiable {
    let id = UUID()
    let name: String
    let actorsImage: [String]
    let cast: [Castmember]
    
}
struct ContentView: View {
    let movies = [
            movie(name:"SandMan",
                  imageName: "SandMan",
                  cast :[
                            Castmember(
                                name: "Tom Sturridge",
                                actorsImage: "Tom Sturridge"),
                            Castmember(
                                name: "Gwendoline Christie",
                                actorsImage: "Gwendoline Christie"),
                            Castmember(
                                name: "Jenna Coleman",
                                actorsImage: "Jenna Coleman"),
                            Castmember(
                                name: "Mason Alexander Park",
                                actorsImage: "Mason Alexander Park"),
                            Castmember(
                                name: "David Thewlis",
                                actorsImage: "David Thewlis")],
                    
                    // The Witcher
                  movie(name:"The Witcher",
                        imageName: "The Witcher",
                        cast :[
                                    Castmember(
                                      name: "Henry Cavill",
                                      actorsImage: "Henry Cavill"),
                                    Castmember(
                                      name: "Anya Chalotra",
                                      actorsImage: "Anya Chalotra"),
                                    Castmember(
                                      name: "Freya Allan",
                                      actorsImage: "Freya Allan"),
                                    Castmember(
                                      name: "Joey Batey",
                                      actorsImage: "Joey Batey"),
                                    Castmember(
                                      name: "Eamon Farren",
                                      actorsImage: "Eamon Farren")],
                        //peaky blinders
                        
                movie(name:"Peaky blinders" ,
                        imageName: "Peaky blinders" ,
                          cast :[
                                    Castmember(
                                        name: "Cillian Murphy",
                                        actorsImage: "Cillian Murphy"),
                                    Castmember(
                                        name: "Paul Anderson",
                                        actorsImage: "Paul Anderson"),
                                    Castmember(
                                        name: "Annabelle Wallis",
                                        actorsImage: "Annabelle Wallis"),
                                    Castmember(
                                        name: "Tom Hardy",
                                        actorsImage: "Tom Hardy"),
                                    Castmember(
                                        name: "Anya Taylor-Joy",
                                        actorsImage: "Anya Taylor-Joy")],
                    //Gilmore Girls
              movie(name:"Gilmore Girl" ,
                      imageName: "Gilmore Girl"  ,
                        cast :[
                                    Castmember(
                                      name: "Alexis Bledel",
                                      actorsImage: "Alexis Bledel"),
                                    Castmember(
                                      name: "Lauren Graham",
                                      actorsImage: "Lauren Graham"),
                                    Castmember(
                                      name: "Milo Ventimiglia",
                                      actorsImage: "Milo Ventimiglia"),
                                    Castmember(
                                      name: "Jared Padalecki",
                                      actorsImage: "Jared Padalecki"),
                                    Castmember(
                                      name: "Scott Patterson",
                                      actorsImage: "Scott Patterson")]
                           ),]
                      
  
                  
//        Movie(name:"The Witcher"),
//        Movie(name:"Peaky Blinder"),
//        Movie(name: "Gilmore Girls")
    ] //    let ActorsInfo = ActorName [
    
    var body: some View {
        
        NavigationView{
                            
                List{
                    
                    ForEach(movies) { movie in
                        
                        NavigationLink(destination: MoviesDetalis(movie: movie)) { //to make new bage inside the main bage we used the destination
                            MainBage(movie: movie)
                        }
                }
                    .navigationTitle("Movies")
                    .accentColor(.white)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
                      
//struct MovieListItem: View {
//  let movie: Movie
//  var body: some View {
//      HStack{
//          Image(movie.actorsImage)
//              .resizable()
//              .frame(width: 100, height: 100)
//              .clipShape(Circle())
//
//          Text(movie.name)
//              .font(.title)
//      }
//  }
//}

struct MoviesDetalis:View{
    let movie: movie
    var body: some View{
        ZStack{
            
            Color.black
            
            Image(movie.name)
                .resizable()
                .scaledToFit()
                .opacity(0.5)
                .blur(radius: 3)
                .ignoresSafeArea()
            
        
        VStack{
            Image(movie.name)
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .padding(4)
                .background(.white)
                .clipShape(Circle())
                .padding()
            Text(movie.name)
                .font(.largeTitle)
                .bold()
                .background(.white)
                .foregroundColor(.black)
            Spacer()
            ScrollView(.horizontal) {
                HStack{
                    ForEach(movie.cast){Castmember in
                        VStack{
                            Image(Castmember.actorsImage)
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
//            HStack{
//
//                Divider()
//                        Text("Test ")
//                            .font(.largeTitle)
//                            .foregroundColor(.red)
//                            .padding()
//
//                ForEach(Actors) {actor in
//                    VStack{
//                        Text("actor\(movie.actor)")
//                    }
//
//                }
//
//                            .padding()
//
//
//                    }
            }
            
        
            
   
        }
       
    }
    }

//struct characterInfo {
//    let actors : Actor
//    var body: some View {
//
//
////        VStack{
////
////            List (actors) {seleactor in
////                HStack{
////                    Image(seleactor)
////                        .resizable()
////                        .frame(width: 70, height: 70)
////                    Text(seleactor.actor)
////                }
////            }
//            .padding()
//
//        }
//    }
//
//}

struct MainBage: View {
    let movie : movie
    var body: some View {
        HStack{
            Image(movie.name)
                .resizable()
                .frame(width: 50, height: 70)
                .clipShape(Circle())
            
            Text(movie.name)
        }
        
    }
}

