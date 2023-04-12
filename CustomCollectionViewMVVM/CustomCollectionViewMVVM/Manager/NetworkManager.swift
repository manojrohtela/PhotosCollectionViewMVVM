//
//  NetworkManager.swift
//  CustomCollectionViewMVVM
//
//  Created by Manoj Kumar on 10/04/23.
//

import Foundation

enum HttpMethod:String{
    case GET = "get"
    case POST = "post"
    case DELETE = "delete"
}

class HttpUtility
{
    func getApiData<T:Decodable>(requestURL:URL,resultType:T.Type,completionHandler:@escaping(_ result:T?)->Void){
        let request = RequestManager.shared.createRequest(url: requestURL,httpMethod: .GET)
        URLSession.shared.dataTask(with: request) { (responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                let decoder = JSONDecoder()
                do{
                    let result = try decoder.decode(T.self, from: responseData!)
                    _=completionHandler(result)
                }
                catch let error{
                    debugPrint("error occured while decoding = \(error)")
                }
            }
        }.resume()
    }
    
    func postAPiData<T:Decodable>(requestURL:URL,requestBody:Data, resultType:T.Type,completionHandler:@escaping(_ result:T?)->Void){
        let request = RequestManager.shared.createRequest(url: requestURL,requestBody: requestBody,httpMethod: .POST)
                URLSession.shared.dataTask(with: request) { (data, httpUrlResponse, error) in
                    if(error == nil && data != nil && data?.count != 0)
                    {
                        do {
                            let response = try JSONDecoder().decode(T.self, from: data!)
                            _=completionHandler(response)
                        }
                        catch let decodingError {
                            debugPrint(decodingError)
                        }
                    }

                }.resume()
    }
    
}
