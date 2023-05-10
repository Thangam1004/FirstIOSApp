//
//  Model.swift
//  LearningSwift
//
//  Created by Thangam on 09/05/23.
//

import Foundation

struct ToDo: Decodable {
    let userId : Int
    let id : Int
    let title : String
    let completed : Bool
}
