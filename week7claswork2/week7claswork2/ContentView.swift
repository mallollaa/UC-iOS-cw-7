//
//  ContentView.swift
//  week7claswork2
//
//  Created by Manal H R Alajmi  on 23/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State var tapBotton: Bool = true
    @State var theMajors = ["هندسه الكمبيوتر","علوم الكمبيوتر  ","تخصصات اخرى "]
 
    @State var selectmajor = ""
    let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.pink, Color.blue]),
        startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack{
            
                backgroundGradient.ignoresSafeArea()
            
                VStack {

                    Spacer()
                    HStack{

                Text("الرجاء اختيار تخصصك الدراسي !")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .padding()
                Image(systemName: tapBotton ? "plus.circle" :"minus.circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(tapBotton == true ? .green: .gray)
                            .onTapGesture {
                                
                                withAnimation(.linear){
                                    tapBotton.toggle()
                    }
                }

                    }
                    Spacer()
                    if tapBotton == false {
                        ForEach(theMajors, id: \.self ) { major in
                            Text(major)
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 300, height: 50)
                                .background( selectmajor == major ? .red: .blue)
                                .cornerRadius(10)
                                .onTapGesture {
                                    selectmajor = major


                            }


                        }
                        Spacer()
                        Text("تخصصك هو:  ")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        Text(" \(selectmajor)")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        Spacer()

                    }

                    Spacer()


                        }
                
                }
                .padding()
                    }

}

     


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

