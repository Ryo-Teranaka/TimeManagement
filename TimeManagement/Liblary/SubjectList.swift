//
//  ApiClient.swift
//  TableView
//
//  Created by Ryo on 2021/09/23.
//

import Foundation

struct SubjectList {
    let items: [SubjectInfo]
}

let subjectList: SubjectList = SubjectList(
    items: [        
        SubjectInfo(imageURL: "英語", name: "英語", goalMin: 80, actMin: 20)
        //SubjectInfo(imageURL: "国語", name: <#T##String#>, goalMin: <#T##Int#>, actMin: <#T##Int#>, subMin: <#T##Int#>)
        //SubjectInfo(imageURL: "数学", name: <#T##String#>, goalMin: <#T##Int#>, actMin: <#T##Int#>, subMin: <#T##Int#>)
    ]
)


class ShareItem {
    
}

/*
class ApiClient {
    static var shared = ApiClient()
    
    func getTopPage(completion: @escaping (SubjectList) -> Void ) {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 0.3)
            DispatchQueue.main.async {
                completion(fake)
            }
        }
    }
}
*/
