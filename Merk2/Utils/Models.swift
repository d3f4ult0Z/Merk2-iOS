//
//  Models.swift
//  Merk2
//
//  Created by Adrian Jacobo on 06/10/21.
//
import Foundation

// MARK: - BasicResponse
struct BasicResponse: Codable {
    let success: Bool
    let mensaje: String
}
// MARK: - ProfileUser
struct ProfileUser: Codable {
    let success: Bool
    let data: [DataProfileUser]
}
// MARK: - DataProfileUser
struct DataProfileUser: Codable {
    let usuario, nombre, correo, imagen: String
}
// MARK: - Store
struct Store: Codable {
    let success: Bool
    let data: [StoreData]
}
// MARK: - StoreData
struct StoreData: Codable {
    let id, nombre, categoria, descripcion: String
    let horario: String
    let imagen: String
    let latitud, longitud: String
}
// MARK: - Products
struct Products: Codable {
    let success: Bool
    let data: [DataProducts]
}
// MARK: - ProductsCart
struct ProductsCart: Codable {
    var cart: [DataProducts]
}
// MARK: - DataProducts
struct DataProducts: Codable {
    let id, nombre, categoria, descripcion: String
    let disponible: String
    let imagen: String
    let existencias, precio, descuento: String
    var cantidad:Int?
}
