//
//  ImagesRepository.swift
//  ImageGallery
//
//  Created by Denis Couras on 7/7/21.
//

import Combine
import Foundation

class ImagesRepository {
    
    private let apiServices = ImagesServiceAPI()
    private var cancellable = Set<AnyCancellable>()
    
    func getImages(callback: @escaping ([ImageResponse]?) -> Void) {
        
        apiServices.getImages()
            .subscribe(on: Schedulers.background)
            .sink{ completion in
                
                switch completion {
                case .failure(let error):
                    print("[Error getImages > \(error.localizedDescription)]")
                    self.cancellable.removeAll()
                    callback(nil)
                    break
                case .finished:
                    break
                }
                
            } receiveValue: { dataResponse in
                self.cancellable.removeAll()
                self.filterImages(dataResponse.data) { imagesResponse in
                    callback(imagesResponse)
                }
            }.store(in: &cancellable)
    }
    
    private func filterImages(_ images: [ImageResponse]?, completion: @escaping ([ImageResponse]) -> Void) {
        guard let images = images else {
            completion([])
            return
        }
        
        var resultImages:[ImageResponse] = []
        
        images.forEach { imageResponse in
            if let type = imageResponse.type, type.contains("image"), let link = imageResponse.link, link.contains("https:") {
                resultImages.append(imageResponse)
            }
        }
        
        completion(resultImages)
    }
}
