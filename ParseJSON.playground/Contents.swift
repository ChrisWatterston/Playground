import UIKit

class ParseJsonConfig: UIViewController {
    
    override func viewDidLoad() {
        jsonParse(currentJSON: skoolPingDefaultConfig)
    }
    
    // default config json
    let skoolPingDefaultConfig = "https://www.chriswatterston.com/ext-src/skoolping/app-config.json"
    
    // default config vars
    public var skoolpingEnabled = Bool()
    public var skoolpingOrganisation = String()
    public var skoolpingBanner = String()
    public var skoolpingLogo = String()
    public var skoolpingNews = String()
    public var skoolpingCalendar = String()
    public var skoolpingContact = Array<AnyObject>()
    public var skoolpingSocial = Array<String>()
    public var skoolpingGallery = Array<String>()
    public var skoolpingNotification = Array<String>()
    
    
    
    func jsonParse(currentJSON: String) {
        
    }
    
    
}