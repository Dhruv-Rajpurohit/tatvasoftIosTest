//
//  UserData.swift
//  TatvasoftPracticalTest
//
//  Created by Dhruv Rajpurohit on 24/04/22.
//

import Foundation

struct Base : Codable {
    let status : Bool?
    let message : String?
    let data : UserData?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(UserData.self, forKey: .data)
    }

}

struct UserData : Codable {
    let users : [Users]?
    let has_more : Bool?

    enum CodingKeys: String, CodingKey {

        case users = "users"
        case has_more = "has_more"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        users = try values.decodeIfPresent([Users].self, forKey: .users)
        has_more = try values.decodeIfPresent(Bool.self, forKey: .has_more)
    }

}

