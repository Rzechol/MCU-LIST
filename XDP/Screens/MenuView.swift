//
//  MenuStart.swift
//  XDP
//
//  Created by Bartosz Rzechółka on 20/07/2022.
//

import SwiftUI

struct MenuStart: View {
    // MARK: - PROPERTY
   @AppStorage("MainView") var isMainViewActive: Bool = true
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var image: String = "LOGO1"
    
   // MARK: - BODY
    var body: some View {
        ZStack{
            Color("ColorGrey")
                .ignoresSafeArea(.all, edges: .all )
            
            VStack(spacing: 33){
                
                Spacer()
                
                VStack(spacing:0){
                    Image("LOGO2")
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                    
                    Text("""
Najwspanialsze filmy w historii ludzkości
""")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                    
                }
                .opacity(isAnimating ? 1 : 0)
                .offset(y : isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
    
                ZStack{
                    ZStack{
                        Circle()
                            .stroke(.black.opacity(0.2), lineWidth: 180)
                            .frame(width: 260, height: 260, alignment: .center)
                            .blur(radius: isAnimating ? 0 : 10)
                            .opacity(isAnimating ? 1 : 0)
                            .scaleEffect(isAnimating ? 1 : 0.5)
                            .animation(.easeOut(duration: 1), value: isAnimating)
                            .onAppear(perform: {
                                isAnimating = true
                            })
                            .offset(x: imageOffset.width * -1)
                            .blur(radius: abs(imageOffset.width / 5))
                            .animation(.easeOut(duration: 1), value: imageOffset)
                        Circle()
                            .stroke(.black.opacity(0.1), lineWidth: 300)
                            .frame(width: 360, height: 260, alignment: .center)
                            .blur(radius: isAnimating ? 0 : 10)
                            .opacity(isAnimating ? 1 : 0)
                            .scaleEffect(isAnimating ? 1 : 0.5)
                            .animation(.easeOut(duration: 1), value: isAnimating)
                            .onAppear(perform: {
                                isAnimating = true
                            })
                            .offset(x: imageOffset.width * -1)
                            .blur(radius: abs(imageOffset.width / 5))
                            .animation(.easeOut(duration: 1), value: imageOffset)
                    }
                    
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .blur(radius: isAnimating ? 0 : 10)
                        .opacity(isAnimating ? 1 : 0)
                        .scaleEffect(isAnimating ? 1 : 0.5)
                        .animation(.easeOut(duration: 1), value: isAnimating)
                        .onAppear(perform: {
                            isAnimating = true
                                
                        })
                        .transition(.opacity)
                        .offset(x: imageOffset.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .gesture(DragGesture()
                                    .onChanged{ gesture in
                            
                            if abs (imageOffset.width) <= 150 {
                                imageOffset = gesture.translation
                                
                                withAnimation(.linear(duration: 0.25)) {
                                    indicatorOpacity = 0
                                    image = "LOGO3"
                                }
                            }
                            
                        }
                                    .onEnded { _ in
                            imageOffset = .zero
                            
                            withAnimation(.linear(duration: 0.25)) {
                                indicatorOpacity = 1
                                image = "LOGO1"
                            }
                        }
                        )
                        .animation(.easeOut(duration: 1), value: imageOffset)
                }
                .overlay(
                Image(systemName: "arrow.left.and.right.circle")
                    .font(.system(size:50, weight: .light))
                    .foregroundColor(.black)
                    .offset(y:70)
                    .blur(radius: isAnimating ? 0 : 10)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
                    .opacity(indicatorOpacity)
                ,alignment: .bottom
                )
                Spacer()
                
                ZStack{
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    Text("Rozpocznij")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .offset(x:20)
                    
                    
                    HStack{
                        Capsule()
                            .fill(Color("ColorBlack"))
                            .frame(width: buttonOffset + 80)
                        Spacer()
                    }
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("ColorBlack").opacity(0.6))
                                
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                               
                            
                            
                            
                        }
                        .foregroundColor(.red)
                    .frame(width: 80, height: 80, alignment: .center)
                    .offset(x:buttonOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                if gesture.translation.width > 0  && buttonOffset <= buttonWidth - 80 {
                                    buttonOffset = gesture.translation.width
                                   
                                    
                                    
                                }
                            }
                            .onEnded { _ in
                                withAnimation(Animation.easeOut(duration: 0.4)) {
                                    if buttonOffset > buttonWidth / 2 {
                                        buttonOffset = buttonWidth - 80
                                        isMainViewActive = false
                                        
                                    }else {
                                        buttonOffset = 0
                                    }
                                }
                                
                            }
                    )
                    
                        
                        Spacer()
                        
                    }
                }
                .frame( width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
                
            }
        }
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

struct MenuStart_Previews: PreviewProvider {
    static var previews: some View {
        MenuStart()
    }
}
 
