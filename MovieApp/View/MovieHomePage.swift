//
//  MovieHomePage.swift
//  MovieApp
//
//  Created by Eyüphan Akkaya on 28.07.2023.
//

import SwiftUI
import Kingfisher

struct MovieHomePage: View {
    
    @State var selected: MovieDBResponse?
    @Namespace private var ns
    @State var numbers = 1
    @ObservedObject var viewModel: MovieDBViewModel
    var body: some View {
        NavigationView {
            VStack {
                
                Text("What do you want to watch?")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .bold()
                    .padding(.leading)
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(viewModel.trendList.flatMap(\.results),id: \.self) { movie in
                            NavigationLink(destination: DetailPage(movie: movie, favState: false, viewModel: viewModel)) {
                                HomePageDesign(viewModel: viewModel,movie: movie)
                                
                            }
                            
                        }
                    }
                    
                }
                .padding()
                ScrollView(.horizontal) {
                    VStack {
                        HStack(spacing: 50) {
                            Button {
                                viewModel.loadNowPlaying()
                                
                                withAnimation {
                                    numbers = 1
                                }
                               
                            } label: {
                                Text("Now playing")
                                    .foregroundColor(.white)
                            }
                            .padding(.leading,20)
                            Button {
                                viewModel.loadUpComing()
                                
                                withAnimation {
                                    numbers = 2
                                }
                            } label: {
                                Text("Upcoming")
                                    .foregroundColor(.white)
                                
                            }
                            Button {
                                viewModel.loadPopular()
                                withAnimation {
                                    numbers = 3
                                }
                            } label: {
                                Text("Popular")
                                    .foregroundColor(.white)
                            }
                        }
                        switch numbers {
                        case 1:
                            Rectangle()
                                .matchedGeometryEffect(id: "animation", in: ns)
                                .frame(width: 90,height: 5,alignment: .leading)
                                .offset(x: -110)
                        case 2:
                            Rectangle()
                                .matchedGeometryEffect(id: "animation", in: ns)
                                .frame(width: 90,height: 5,alignment: .leading)
                                .offset(x: 25)
                        case 3:
                            Rectangle()
                                .matchedGeometryEffect(id: "animation", in: ns)
                                .frame(width: 90,height: 5,alignment: .leading)
                                .offset(x: 150)
                                
                                

                        default:
                            Text("Hata")
                        }
                        
                    }
                }
                .padding()
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]) {
                        SubTitlePageDesign(viewModel: viewModel)
                    }
                }
                
            }
            .background(Color("background"))
        }
        
        .onAppear{
            UINavigationBar.appearance().tintColor = .white
            viewModel.loadTrending()
        }

        
    }

    
    
}

struct MovieHomePage_Previews: PreviewProvider {
    static var previews: some View {
        MovieHomePage(viewModel: MovieDBViewModel())
    }
}
