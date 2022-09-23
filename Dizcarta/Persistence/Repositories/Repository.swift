//
//  Repository.swift
//  Dizcarta
//
//  Created by Igor Samoel da Silva on 23/09/22.
//

import Foundation
import CoreData

protocol Repository: AnyObject {
    var context: NSManagedObjectContext { get set }
}
