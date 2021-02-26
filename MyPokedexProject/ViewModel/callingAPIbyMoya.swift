//
//  callingAPIbyMoya.swift
//  MyPokedexProject
//
//  Created by pongpon on 9/2/2564 BE.
//

import Foundation
import Moya

protocol ApplyMoya {
    func callingAPIbyMoya()
}

extension ViewController: ApplyMoya {
    
    func callingAPIbyMoya() {
        let provider = MoyaProvider<MyService>()
        provider.request(.getCard) { [weak self] result in
            
            guard let self = `self` else {return} // Prevent memory leak with retain cycle
            
            switch result {
            case let .success(moyaResponse):
                let statusCode = moyaResponse.statusCode // Int - 200, 401, 500, etc
                print(statusCode)
                
                self.mappingJson(resonse: moyaResponse)
                
                let data = moyaResponse.data // Data, your JSON response is probably in here!
                self.mappingCard(data: data)
                
            case .failure(_): break
                
            }
        }
    }
    
    private func mappingJson(resonse: Response) {
        do {
            let filteredResponse = try resonse.filterSuccessfulStatusCodes()
            let json = try filteredResponse.mapJSON()  // type Any
        }
        catch let error {
            print(error)
        }
    }
    
    private func mappingCard(data: Data) {
        do {
            
            let users = try JSONDecoder().decode(Card.self, from: data)
            if users != nil {
                print("name = \(users.name)")
                print("hp = \(users.hp)")
            }
        }
        catch let error {
            print(".....error...")
            print(error)
        }
    }
}




