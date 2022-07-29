//
//  PosterCardView.swift
//  XDP
//
//  Created by Bartosz Rzechółka on 24/07/2022.
//

import SwiftUI

struct PosterCardView: View {
    // MARK: -  PROPERTIES
    
    var poster: Poster
    
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    var body: some View {
        
        ZStack {
            VStack  {
                // POSTERS: IMAGE
                Image(poster.image)
                
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
                    .frame(width: 400, height: 520, alignment: .center)
                    .scaleEffect(isAnimating ? 1.0 : 0.6)
                
                // POSTERS: TITLE
                Text(poster.title)
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
                Text(poster.subtitle)
                    .foregroundColor(Color.white)
                    .font(.title3)
                    .fontWeight(.heavy)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
                // POSTERS: HEADLINE
                Text(poster.headline)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
                    
              
                // BUTTON: START
                StartButtonView()
                    .padding()
                    
                    
                    
            } //: VSTACK
        } //: ZSTACK
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        }
        .frame(minWidth: 0,  maxWidth: .infinity, minHeight: 0,  maxHeight: .infinity, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors:poster.gradientColors),startPoint: .leading,endPoint:  . bottom))
        .cornerRadius(20)
        .padding(.horizontal,20)
        .padding(.vertical, 18)
        
        
    }
}

struct PosterCardView_Previews: PreviewProvider {
    static var previews: some View {
        PosterCardView(poster: posterData[1])
            .previewLayout(.fixed(width: 320, height: 640))
    }
}
