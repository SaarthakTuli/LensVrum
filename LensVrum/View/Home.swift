//
//  Home.swift
//  LensVrum
//
//  Created by Saarthak Tuli on 03/12/22.
//

import SwiftUI

struct Home: View {
    
    @State var selected: String = tabs[0]
    @Namespace var animation
    
    @State var show: Bool = false
    @State var selectedItem: Item = items[0]
    
    var body: some View {
        ZStack {
            VStack {
                
                // MARK: Top Header Bar
                HStack {
                    
                    Button(action: {}) {
                        Image(systemName: "line.horizontal.3.decrease")
                            .font(.system(size: 25, weight: .heavy))
                            .foregroundColor(.black)
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {}) {
                        Image("profile")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 45, height: 45)
                            .cornerRadius(15)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                
                
                ScrollView {
                    VStack {
                        
                        // MARK: Lets Get Started
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Let's")
                                    .font(.title)
                                    .foregroundColor(.black)
                                
                                Text("Get Started")
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.black)
                            }
                            .padding(.horizontal)
                            
                            Spacer(minLength: 0)
                        }
                        
                        
                        // MARK: Tab Icons
                        HStack(spacing: 0) {
                            
                            ForEach(tabs, id: \.self) { tab in
                                
                                TabButton(title: tab, selected: $selected, animation: animation)
                                
                                if tabs.last != tab { Spacer(minLength: 0) }
                                
                            }
                        }
                        .padding()
                        .padding(.top, 5)
                        
                        // MARK: Product View
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 25) {
                            
                            ForEach(items) { item in
                                
                                CardView(item: item, animation: animation)
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            selectedItem = item
                                            show.toggle()
                                        }
                                    }
                            }
                        }
                        .padding()
                    }
                }
                
                
                Spacer(minLength: 0)
            }
            .background(Color.white.ignoresSafeArea())
            .opacity(show ? 0 : 1)
            
            if show {
                Details(selected: $selectedItem, show: $show, animation: animation)
            }
        }
    }
}


var tabs = ["Glasses", "Watched", "Shoes" ,"Perfume"]




struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
