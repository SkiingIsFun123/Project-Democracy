//
//  BalletpediaModel.swift
//  Democracy
//
//  Created by Jevon Mao on 9/3/22.
//

import Foundation
import SwiftyJSON

struct BallotpediaElection: Codable {
    let date: Date
    let districts: [District]

    struct District: Codable {
        let name: String
        let type: String
        let races: [Race]
    }

    struct Race: Codable {
        let name: String
        let level: String
        let candidates: [Candidate]
    }

    struct Candidate: Codable, Hashable {
        let name: String
        let party: String?
        let imageUrl: URL?
        let isIncumbent: Bool
        let facebookUrl: URL?
        let twitterUrl: String?
        let websiteUrl: URL?
        let biography: String
        var phone: String
        var address: String
        var sectors: [String: String]
        var organizations: [String: String]
    }

    enum ElectionLevel: String, Codable {
        case federal, state, local
    }
}


extension URLSession {
    func codableTask(with request: Endpoint,
                                 completionHandler: @escaping (JSON?) -> Void) -> Void {
        return self.dataTask(with: request.request) { data, response, error in
            guard let data = data,
                  let urlResponse = response as? HTTPURLResponse,
                  error == nil
            else {
                completionHandler(nil)
                return
            }
            guard (200...299).contains(urlResponse.statusCode)
            else {
                completionHandler(nil)
                return
            }
            completionHandler(try? JSON(data: data))
        }.resume()
    }
}
