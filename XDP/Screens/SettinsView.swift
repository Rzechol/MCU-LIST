//
//  SettinsView.swift
//  XDP
//
//  Created by Bartosz Rzechółka on 25/07/2022.
//

import SwiftUI

struct SettinsView: View {
    //MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("MainView") var isMainViewActive: Bool = false
    
    //MARK: - BODY
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators:  false) {
                VStack(spacing: 20) {
                    //MARK: - SECTION1
                    
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "MCU LIST", labelImage: "info.circle")
                    ){
                        Divider().padding(.vertical, 4)
                        
                        HStack(alignment: .center, spacing: 10){
                            Image("ICON")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                               
                        
                        Text("Aplikacja posiadajaca zbiór filmów z pod szyldu MARVEL STUDIOS. Wykonana w programie XCode w języku SWIFT")
                                .font(.footnote)
                    }
                    }
                    
                    //MARK: - SECTION2
                    GroupBox(
                        label: SettingsLabelView(labelText: "RESTART", labelImage: "arrow.triangle.2.circlepath.circle")
                    ){
                        Divider().padding(.vertical, 4)
                        
                        Text("Aby zacząć od Menu zaznacz RESTART ")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        
                        Toggle(isOn: $isMainViewActive) {
                            if isMainViewActive {
                                Text("RESTARTED".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.green)
                            } else {
                                Text("RESTART".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.secondary)
                            }
                        }
                        .padding()
                        .background(
                            Color(UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                    }
                    
                    //MARK: - SECTION3
                    
                    GroupBox(
                        label: SettingsLabelView(labelText: "APPLICATION", labelImage: "apps.iphone")
                    ) {
                        
                       
                        SettingsRowView(name: "DEVELOPER", content: "Bartosz Rzechółka")
                        SettingsRowView(name: "DESIGNER", content: "Bartosz Rzechółka")
                        SettingsRowView(name: "COMPATIBILITY", content: "IOS 15")
                        SettingsRowView(name: "WEBSITE", linkLabel: "AM SZCZECIN", linkDestination: "am.szczecin.pl")
                        SettingsRowView(name: "SWIFTUI", content: "3.0")
                        SettingsRowView(name: "VERSION", content: "1.0.0")
                        
                       
                        
                        
                    }
                    
                    
                }
                .navigationBarTitle(Text("USTAWIENIA"),displayMode: .large)
                .navigationBarItems(
                trailing:
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                            
                    }
                )
                .padding()
            }
        }
    }
}
//MARK: - PREVIEW
struct SettinsView_Previews: PreviewProvider {
    static var previews: some View {
        SettinsView()
            .preferredColorScheme(.dark)
    }
}
