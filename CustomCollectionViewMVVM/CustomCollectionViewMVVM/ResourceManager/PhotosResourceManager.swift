//
//  PhotosResourceManager.swift
//  CustomCollectionViewMVVM
//
//  Created by Manoj Kumar on 12/04/23.
//

import Foundation
struct PhotosResource{
    func getPhotos(photoRequest:PhotoRequestModel,photoRequestcompletion: @escaping (_ result: PhotosModel?)->Void){
        let urlList = Endpoints.getUserList + "?per_page=\(photoRequest.per_page)?page=\(photoRequest.page)"
        let getPhotosURl = URL(string: urlList)!
        let httpUtility = HttpUtility()
        httpUtility.getApiData(requestURL: getPhotosURl, resultType: PhotosModel.self) { result in
                _=photoRequestcompletion(result)
        }
        
    }
}
