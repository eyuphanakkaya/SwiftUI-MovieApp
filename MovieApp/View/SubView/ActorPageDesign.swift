//
//  ActorPageDesign.swift
//  MovieApp
//
//  Created by Eyüphan Akkaya on 2.08.2023.
//

import SwiftUI
import Kingfisher

struct ActorPageDesign: View {
    @ObservedObject var viewModel: MovieDBViewModel
    var movie: MovieResult?
    @State var actors: Actors?
    @State var dizi = [String]()
    var body: some View {
        
        ScrollView(.horizontal) {

            HStack{
                if let actor = actors?.cast {
                   
                    ForEach(actor.prefix(5),id: \.hashValue) { cast in
                        VStack {
                            HStack {
                                if let image = cast.profile_path {
                                    KFImage(URL(string: "https://image.tmdb.org/t/p/w500\(image)"))
                                        .resizable()
                                        .clipShape(Circle())
                                        .frame(width: 85,height: 100)
                                }
                            }
                            .padding(.bottom,20)
                            Text(cast.name ?? "")
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                                .offset(x:-25)
                                .padding(.top,20)
                                .padding(.leading,30)
                        }
                    }
                }
                         
                
            }
        }
        
        .background(Color("background"))
        .edgesIgnoringSafeArea(.all)
        .onAppear{
            viewModel.fetchActors(id: movie?.id ?? 0) { result in
                self.actors = result
               
            }
        }
        
    }
}

struct ActorPageDesign_Previews: PreviewProvider {
    static var previews: some View {
        ActorPageDesign(viewModel: MovieDBViewModel())
    }
}
