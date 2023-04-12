//
//  Request.swift
//  CustomCollectionViewMVVM
//
//  Created by Manoj Kumar on 12/04/23.
//

import Foundation
class RequestManager{
    static var shared = RequestManager()
    init(){}
    
    
    
    func createRequest(url:URL,requestBody:Data? = nil,httpMethod:HttpMethod)->URLRequest{
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.addValue("LPGsuhSyFRI1okTtoWAsv7P8D3MjSywXJ6WuoVu9FcssGIJ72H80bySU", forHTTPHeaderField: "Authorization")
        return urlRequest
    }
}
