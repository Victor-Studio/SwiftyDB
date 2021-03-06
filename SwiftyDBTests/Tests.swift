// https://github.com/Quick/Quick

import Quick
@testable import SwiftyDB


func SwiftXDb(databaseName: String)->swiftyDb{
    let database = SwiftyDb_Init(databaseName: databaseName)
    try! database.open()
    return database as! swiftyDb
}

func SwiftXDbReset(databaseName: String)->swiftyDb{
    delDBfile(databaseName)
    return SwiftXDb(databaseName: databaseName)
}

func delDBfile(_ databaseName: String){
    let documentsDir : String = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
    let path = documentsDir + "/" + databaseName + ".sqlite"
    if FileManager.default.fileExists(atPath: path){
        let _ = try! FileManager.default.removeItem(atPath: path)
    }
}

class SwiftyDBSpec: QuickSpec {
    override func spec() {
        delDBfile("test_database")
//        let documentsDir : String = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
//        let path = documentsDir+"/test_database.sqlite"
//        if FileManager.default.fileExists(atPath: path){ 
//            let _ = try! FileManager.default.removeItem(atPath: path)
//        }
    }
}
