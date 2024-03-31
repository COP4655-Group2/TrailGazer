import Foundation
import UIKit
import CoreLocation
import ParseSwift


    
struct Post: ParseObject {

    

    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?

    var caption: String?
    var user: User?
    var imageFile: ParseFile?
    var location: ParseGeoPoint?

    

}


    

