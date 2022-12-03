//
//  Details.swift
//  LensVrum
//
//  Created by Saarthak Tuli on 03/12/22.
//

import SwiftUI


struct Details: View {
    @Binding var selected: Item
    @Binding var show: Bool
    
    var animation: Namespace.ID
    
    @State var loadingContent = false
    @State var selectedColor: Color = Color("p3")
    
    var body: some View {
        
        ScrollView(UIScreen.main.bounds.height < 750 ? .vertical : .init(), content: {
            VStack {
                
                // MARK: Top Icon Bar
                HStack(spacing: 25) {
                    
                    Button(action: {
                        withAnimation(.spring()) { show.toggle() }
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "bag")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    
                }
                .padding()
                
                VStack(spacing: 10) {
                    Image(selected.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "image\(selected.id)", in: animation)
                        .padding()
                        .shadow(color: Color(selected.image), radius: 5, x: 5, y: 5)
                    
                    Text(selected.title)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                    Text(selected.subtitle)
                        .foregroundColor(.gray)
                        .padding(.top, 4)
                    
                    HStack {
                        
                        Text(selected.rating)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .matchedGeometryEffect(id: "rating\(selected.id)", in: animation)
                        
                        Spacer(minLength: 0)
                        
                        
                        Button(action: {}) {
                            Image(systemName: "suit.heart")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        .matchedGeometryEffect(id: "heart\(selected.id)", in: animation)
                        
                        
                        
                        
                        
                    }
                    .padding()
                }
                .padding()
                .background(
                    Color(selected.image)
                        .clipShape(CustomShape())
                        .matchedGeometryEffect(id: "color\(selected.id)", in: animation)
                )
                .cornerRadius(15)
                .padding()
                
                // delaying load for animation
                
                VStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Exclusive Offer")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Text("Frame + Lens for $35 (It is 50% OFF)")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 30, alignment: .leading)
                    .background(Color("p3"))
                    .cornerRadius(15)
                    
                    // MARK: COLORS
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("Color")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        HStack(spacing: 15) {
                            ForEach(1...4, id: \.self) { i in
                                ZStack {
                                    Color("p\(i)")
                                        .clipShape(Circle())
                                        .frame(width: 45, height: 45)
                                        .onTapGesture {
                                            withAnimation { selectedColor = Color("p\(i)") }
                                        }
                                    
                                    if selectedColor == Color("p\(i)") {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.black)
                                    }
                                    
                                    
                                }
                            }
                            
                            Spacer(minLength: 0)
                        }
                        
                    }
                    .padding()
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {}) {
                        Text("TRY FRAME IN 3D")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    }
                    
                    Button(action: {}) {
                        Text("ADD TO CART")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.black)
                        )
                    }
                    .padding(.vertical)
                }
                .padding([.horizontal, .bottom])
                .frame(height: loadingContent ? nil : 0)
                .opacity(loadingContent ? 1 : 0)
                
                Spacer(minLength: 0)
            }
        })
        .onAppear {
            withAnimation(Animation.spring().delay(0.5)) { loadingContent.toggle() }
        }
    }
}


