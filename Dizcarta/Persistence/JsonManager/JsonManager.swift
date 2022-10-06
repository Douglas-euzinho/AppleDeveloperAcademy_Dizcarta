//
//  JsonManager.swift
//  Dizcarta
//
//  Created by Igor Samoel da Silva on 06/10/22.
//

import Foundation

struct JsonManager {
    
    static func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            debugPrint("[ERROR] Load json file: \(error)")
        }
        return nil
    }
    
    static func parse<T: Codable> (data: Data) -> T? {
        do {
           return try JSONDecoder().decode(T.self, from: data)
        } catch {
            debugPrint("[ERROR] \(error)")
        }
        return nil
    }
    
    static func decodeJson<T: Codable>(forName name: String) -> T? {
        guard let data = readLocalFile(forName: name) else { return nil }
        return parse(data: data)
    }
}
