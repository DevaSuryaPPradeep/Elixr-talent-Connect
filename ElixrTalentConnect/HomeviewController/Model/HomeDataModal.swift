//
//  HomeDataModal.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 21/01/24.
//

import Foundation

/// This is the dataModel for the MVVM architecture implemented in the Home view.
struct JobsResponse : Codable {
    let jobs : [Jobs]
}

/// This how that data is oraganised in the API.
struct Jobs : Codable {
    let id : String?
    let title : String
    let department : String
    let postedDate : String
    let deadlineDate : String
    let description : String
    let responsibilities : String
    let requirements : String
    let location : String
    let salary : String
    let status : String
}



