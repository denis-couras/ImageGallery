//
//  GalleryViewModel.swift
//  ImageGallery
//
//  Created by Denis Couras on 7/7/21.
//

import Foundation

class GalleryViewModel : ObservableObject {
    
    @Published var isLoading = true
    @Published var errorMessage = ""
    @Published var images = [ImageResponse]()
    
    var item:Int = 0
    
    private let imagesRepository = ImagesRepository()
    
    init() {
        loadImages()
    }
    
    func loadImages() {
        
        self.item = 0
        self.isLoading = true
        self.errorMessage = ""
        
        imagesRepository.getImages { images in
            self.isLoading = false
            
            guard let images = images else {
                self.errorMessage = "Erro ao baixar imagens"
                return
            }
            
            self.images = images
        }
    }
    
    func getTotalRows() -> Int {
        Int(Double(Double(self.images.count) / 4.0).rounded(.up))
    }
    
    func getNextImageItem() -> ImageResponse {
        
        let imageResponse = self.images[self.item]
        self.item += 1
        
        if self.images.endIndex == self.item {
            self.item = 0
        }
        
        return imageResponse
    }
}
