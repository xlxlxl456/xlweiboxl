//
//  NetworkTools.swift
//  AFNetworkingTest
//
//  Created by UCL on 2021/12/29.
//

import AFNetworking

enum RequestType{
    case GET
    case POST
}

class NetworkTools: AFHTTPSessionManager {
    static let shareInstance: NetworkTools = {
        let tools = NetworkTools()
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        tools.responseSerializer.acceptableContentTypes?.insert("text/plain")
        
        return tools
    }()
}

extension NetworkTools {
    func request(method: RequestType, urlString: String, parameters: [String : AnyObject], finished: @escaping(_ result: AnyObject?, _ error: NSError?) -> ()){
        if method == .GET{
            get(urlString, parameters: parameters, headers: nil, progress: nil) { task, result in
                finished(result as AnyObject,nil)
            } failure: { task, error in
                finished(nil,error as NSError)
            }
        }else{
            post(urlString, parameters: parameters, headers: nil, progress: nil) { task, result in
                finished(result as AnyObject,nil)
            } failure: { task, error in
                finished(nil,error as NSError)
            }
        }
    }
}

extension NetworkTools{
    func loadAccessToken(code: String, finished: @escaping(_ result: [String: AnyObject]?, _ error: NSError?) -> ()) {
        let urlString = "https://api.weibo.com/oauth2/access_token"
        
        let parameters = ["client_id":app_key, "client_secret": app_scecret, "grant_type": "authorization_code", "redirect_uri": redirect_uri, "code": code]
        
        request(method: .POST, urlString: urlString, parameters: parameters as [String: AnyObject]) { result, error in
            finished(result as? [String : AnyObject],error)
        }
    }
    
    func loadUserInfo(access_token: String, uid: String,finished: @escaping(_ result: [String : AnyObject]?, _ error: NSError?) -> ()){
        let urlString = "https://api.weibo.com/2/users/show.json"
        let parameters = ["access_token":access_token, "uid": uid]
        
        request(method: .GET, urlString: urlString, parameters: parameters as [String: AnyObject]) { result, error in
            finished(result as? [String : AnyObject],error)
        }
    }
}
