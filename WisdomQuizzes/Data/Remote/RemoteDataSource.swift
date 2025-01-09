//
//  RemoteDataSource.swift
//  WisdomQuizzes
//
//  Created by Andres Cordón on 3/1/25.
//

import Foundation

enum UsersEndpoints: String {
    case login = "users/login"
}

enum HttpMethod: String {
    case post = "POST"
    case get = "GET"
}

protocol RemoteDataSourceProtocol {
    func login(username: String, password: String) async throws -> BaseResponse<LoginDTO>
}


struct RemoteDataSource {
    
    private init(){}
    
    static let shared: RemoteDataSource = RemoteDataSource()
    
    let url: String = "http://localhost:8080/api/"
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    
    func request(endpoint: String, method: HttpMethod, body: Data?) throws -> URLRequest {
        guard let url = URL(string: endpoint, relativeTo: URL(string: url)) else {
            print("Url inválida")
            throw ErrorResponse(code: URLError.badURL.rawValue, message: "Url inválid", type: "URLError")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        return request
    }
    
    func login(username: String, password: String) async throws -> BaseResponse<LoginDTO> {
        
        let body: [String: Any] = [
            "username": username,
            "password": password
        ]
        
        guard let bodyData = try? JSONSerialization.data(withJSONObject: body) else {
            throw ErrorResponse(code: 500, message: "La codificación de los datos recibidos no ha salido correctamente", type: "iOSError")
        }
        
        let request = try request(endpoint: UsersEndpoints.login.rawValue, method: HttpMethod.post, body: bodyData)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        do {
            print("decodificacion empezada")
            return try JSONDecoder().decode(BaseResponse<LoginDTO>.self, from: data)
        } catch {
            print("Error al decodificar ")
            let result = try JSONDecoder().decode(ErrorEntryResponse.self, from: data)
            throw result.error
        }
    }
}
