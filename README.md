# DataDemo
A demo about how to use Alamofire, Moya, SwiftyJSON and ObjectMapper to handle data received from server.

![](https://github.com/iwufan/Resources/blob/master/Images/DataDemo/img_data_display.gif)

### Public API
Hot novels list api：[https://www.apiopen.top/novelApi](https://www.apiopen.top/novelApi)

### Moya Related
1. create file `NovelService.swift`.
2. create enum `NovelService`.
3. define a enum value.
4. create extension for `NovelService`, and implement `TargetType` protocol.
5. implement all related functions of `TargetType` protocol.
###### example:
```
enum NovelService {
    case novelList
}
extension NovelService: TargetType {
    var baseURL: URL {
        return URL(string: "https://www.apiopen.top")!
    }
    var path: String {
        switch self {
        case .novelList:
            return "novelApi"
        }
    }
    var method: Moya.Method {
        switch self {
        case .novelList:
            return .get
        }
    }
    var sampleData: Data {
        return Data()
    }
    var task: Task {
        switch self {
        case .novelList:
            return .requestPlain
        }
    }
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
```
### Base Request with SwiftyJSON
1. create a provider.
2. create another extension for NovelService, and define a static request function.
###### example:
```
private let novelProvider = MoyaProvider<NovelService>()
```
```
extension NovelService {
    
    static func request(_ target: NovelService, success: @escaping ([String: Any]) -> Void, failure: ((MoyaError) -> Void)? = nil) {
        
        novelProvider.request(target) { (result) in
            switch result {
            case let .success(response):
                do {
                    let data = try response.mapJSON()
                    let json = JSON(data)
                    let jsonData:Data = json.rawString()!.data(using: .utf8)!
                    
                    let dict = try JSONSerialization.jsonObject(with: jsonData,
                                                                options: .mutableContainers) as! Dictionary<String, Any>
                    if dict["code"] as! Int == 200  {
                        
                        success(dict)
                    } else {
                        HUD.showFailure(dict["msg"] as! String)
                    }
                } catch {
                    HUD.showFailure("请求失败")
                }
            case let .failure(error):
                
                if let failure = failure {
                    failure(error)
                }
                print(error.localizedDescription)
            }
        }
    }
}
```
You can get a dictionary in the success closure.
### ObjectMapper Related
###### example:
```
import Foundation
import ObjectMapper

struct Novel: Mappable {
    
    var bookID: String!
    var name: String!
    var authorName: String!
    var brief: String!
    var coverURL: String!
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        bookID      <- map["bid"]
        name        <- map["bookname"]
        authorName  <- map["author_name"]
        brief       <- map["introduction"]
        coverURL    <- map["book_cover"]
    }
}
```
### Dictionary to model in view controller
1. define a data array.
2. convert dictionary array to model array.
###### example:
```
lazy var dataArray: [Novel] = {
        return []
    }()
```
```
HUD.show()
        
NovelService.request(.novelList, success: { (res) in
            
    HUD.hide()
            
    self.dataArray = Mapper<Novel>().mapArray(JSONArray: res["data"] as! [[String : Any]])
    self.tableView.reloadData()
})
```

Please refer to the demo for more details.
### Contact Me
[悟饭哪](https://www.jianshu.com/u/819830158b47)

###### Thanks
