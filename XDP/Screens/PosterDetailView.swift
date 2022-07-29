//
//  PosterDetailView.swift
//  XDP
//
//  Created by Bartosz Rzechółka on 25/07/2022.
//

import SwiftUI

struct PosterDetailView: View {
    //MARK: - PROPERTIES
    
    var poster: Poster
    
    //MARK: - BODY
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .center, spacing: 20) {
                    //HEADER
                    PosterHeaderView(poster: poster)
                    VStack(alignment: .leading, spacing: 20){
                        // TITLE
                        Text(poster.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(poster.gradientColors[1])
                        
                        // HEADLINE
                        Text(poster.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        
                        // OPIS
                        DetailIfoView(poster:poster)
                        
                        // SUBHEADLINE
                        Text(" OPIS \(poster.title) \(poster.subtitle)".uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(poster.gradientColors[1])
                        
                        
                        
                        // DESCRIPTION
                        Text(poster.description)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            
                        
                        
                        // LINK
                        SourceLinkView()
                            .padding(.top, 10)
                            .padding(.bottom, 40)
                        
                    } //: VSTACK
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment:  .center)
                } //: VSTACK
                .navigationBarTitle(poster.title, displayMode: .inline)
                .navigationBarHidden(true)
            } //: SCROLL
            .edgesIgnoringSafeArea(.top)
            
        }//: NAVIGATION
    }
}
    //MARK: - PREVIEW
struct PosterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PosterDetailView(poster: posterData[0])
    }
}
