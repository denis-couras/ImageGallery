//
//  ContentView.swift
//  ImageGallery
//
//  Created by Denis Couras on 7/7/21.
//

import SwiftUI
import Kingfisher

struct GalleryView: View {
    
    @StateObject var vm: GalleryViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                
                if vm.isLoading {
                    VStack {
                        ActivityIndicatorView()
                        Text("Carregando...")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                    }
                    .padding()
                    .background(Color.black.opacity(0.6))
                    .cornerRadius(8)
                } else {
                    ZStack {
                        if !vm.errorMessage.isEmpty {
                            VStack(alignment: .center, spacing: 12) {
                                Image(systemName: "xmark.octagon.fill")
                                    .font(.system(size: 64, weight: .semibold))
                                    .foregroundColor(.red)
                                Text(vm.errorMessage)
                                    .multilineTextAlignment(.center)
                            }.padding()
                        }
                        
                        VStack {
                            GeometryReader { geometry in
                                GridView(rows: self.vm.getTotalRows(), columns: 4) { row, col in
                                    ImageGalleryView(width: geometry.size.width)
                                }
                                .padding(.leading, 7)
                                .padding(.top, 10)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Gallery", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.vm.loadImages()
                }) {
                    Image(systemName: "arrow.clockwise.circle")
                        .font(.system(size: 20, weight: .light))
                }
            )
        }
    }
    
    fileprivate func ImageGalleryView(width: CGFloat) -> some View {
        
        let wd = width / 4
        let image = self.vm.getNextImageItem()
        
        return VStack(alignment: .leading) {
            KFImage(URL(string: image.link ?? ""))
                .resizable()
                .scaledToFill()
                .frame(width: wd - 24, height: wd - 24)
                .cornerRadius(4)
                .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color(.init(white: 0, alpha: 0.2))))
                .padding(.horizontal, 6)
                .padding(.vertical, 6)
        }.asTile()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView(vm: .init())
    }
}
