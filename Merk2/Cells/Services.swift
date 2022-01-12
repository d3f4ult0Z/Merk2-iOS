//
//  Services.swift
//  Merk2
//
//  Created by Adrian Jacobo on 06/10/21.
//

import Foundation
import Alamofire

public class Services{
    public func request<ResponseType: Codable, ParamsObject: Decodable & Encodable>(_ url:String, complemet:String, method: HTTPMethod, params: ParamsObject, model: ResponseType.Type, handler: @escaping (_ request: ResponseType?, _ error: NSError?) -> Void){
        
        let completURL = "\(url)\(complemet)"
        let headers:HTTPHeaders = [
//            HTTPHeader(name: "x-plataforma", value: "iOS")
//            HTTPHeader(name: "x-version-plataforma", value: UIDevice.current.systemVersion),
//            HTTPHeader(name: "x-version-aplicacion", value: Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String),
//            HTTPHeader(name: "x-id-dispositivo", value: UUID().uuidString),
//            HTTPHeader(name: "x-nombre-dispositivo", value: UIDevice.current.name),
//            //HTTPHeader(name: "x-idAcceso", value: idAcceso!),
            HTTPHeader(name: "Content-Type", value: "application/x-www-form-urlencoded")
        ]
        
        print("-------------------Conectandose a API-------------------")
        print("URL---------->\(completURL)")
        print("Metodo------->\(method)")
        print("Parametros--->\(params)")
        print("Modelo------->\(model)")
        print("Cabeceras---->\(headers)")
        print("--------------------------------------------------------")
        
        AF.request(completURL, method: method, parameters: params, encoder: URLEncodedFormParameterEncoder.default, headers: headers).responseJSON{response in
            let decoder = JSONDecoder()
            do{
                let responseModel = try decoder.decode(model, from: response.data!)
                handler(responseModel, nil)
            }catch{
                handler(nil,response.error as NSError?)
            }
        }
    }
}
