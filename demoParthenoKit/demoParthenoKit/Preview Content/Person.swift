//
//  Person.swift
//  demoParthenoKit
//
//  Created by Michele Vassallo Todaro on 07/02/25.
//

import Foundation

struct Person: Identifiable, Codable {
    public var id: String
    public var firstName: String = ""
    public var lastName: String  = ""
}
