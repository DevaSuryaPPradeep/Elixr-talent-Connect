//
//  JobsDisplayManager.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 05/02/24.
//

import Foundation
 
class JobManager{
    static let shared = JobManager()
    var arrayOfJobs :[Jobs] = []
    var jobAddedCallBack: () ->Void = {}
    private init(){}

    func addjobs(_jobItem:Jobs){
        arrayOfJobs.append(_jobItem)
        jobAddedCallBack()
    }
}
