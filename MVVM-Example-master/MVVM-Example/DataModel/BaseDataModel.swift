//  BaseDataModel.swift
//  MVVM-Example
//  Created by Chandresh on 30/9/19.
//  Copyright © 2019 Chandresh Maurya. All rights reserved.
/******  To parse the JSON, add this file to your project and do:
 let baseDataModel = try BaseDataModel(json)    ******/

import Foundation
// MARK: - BaseDataModel
struct BaseDataModel: Codable {
    let deposits: Deposits?
    let creditCards: CreditCards?
    let loans: Deposits?
    let insurance: Deposits?
    let termsandconditions: Termsandconditions?
    enum CodingKeys: String, CodingKey {
        case deposits
        case creditCards
        case loans
        case insurance
        case termsandconditions
    }
}
// MARK: BaseDataModel Convenience Initializers & Mutators
extension BaseDataModel {
    init(data: Data) throws {
        self = try base_JSON_Decoder().decode(BaseDataModel.self, from: data)
    }
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    func with(
        deposits: Deposits?? = nil,
        creditCards: CreditCards?? = nil,
        loans: Deposits?? = nil,
        insurance: Deposits?? = nil,
        termsandconditions: Termsandconditions?? = nil
        ) -> BaseDataModel {
        return BaseDataModel(
            deposits: deposits ?? self.deposits,
            creditCards: creditCards ?? self.creditCards,
            loans: loans ?? self.loans,
            insurance: insurance ?? self.insurance,
            termsandconditions: termsandconditions ?? self.termsandconditions
        )
    }
    func jsonData() throws -> Data {
        return try base_JSON_Encoder().encode(self)
    }
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
// MARK: - CreditCards
struct CreditCards: Codable {
    let bannerImg: String?
    let bannerLink: String?
    let headerTitle: String?
    let itemList: [CreditCardsItemList]?
    enum CodingKeys: String, CodingKey {
        case bannerImg
        case bannerLink
        case headerTitle
        case itemList
    }
}
// MARK: CreditCards Convenience Initializers & Mutators
extension CreditCards {
    init(data: Data) throws {
        self = try base_JSON_Decoder().decode(CreditCards.self, from: data)
    }
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    func with(
        bannerImg: String?? = nil,
        bannerLink: String?? = nil,
        headerTitle: String?? = nil,
        itemList: [CreditCardsItemList]?? = nil
        ) -> CreditCards {
        return CreditCards(
            bannerImg: bannerImg ?? self.bannerImg,
            bannerLink: bannerLink ?? self.bannerLink,
            headerTitle: headerTitle ?? self.headerTitle,
            itemList: itemList ?? self.itemList
        )
    }
    func jsonData() throws -> Data {
        return try base_JSON_Encoder().encode(self)
    }
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
// MARK: - CreditCardsItemList
struct CreditCardsItemList: Codable {
    let isInstantCard: Bool?
    let title: String?
    let itemListDescription: String?
    let fullDescription: String?
    let img: String?
    let link: String?
    let buttonTitle: ButtonTitle?
    let type: PurpleType?
    let category: Category?
    let accountType: AccountType?
    let cardType: String?
    let annualFees: String?
    let feeWaiver: FeeWaiver?
    let promoCode: String?
    enum CodingKeys: String, CodingKey {
        case isInstantCard = "isInstantCard"
        case title = "title"
        case itemListDescription = "description"
        case fullDescription = "fullDescription"
        case img = "img"
        case link = "link"
        case buttonTitle = "buttonTitle"
        case type = "type"
        case category = "category"
        case accountType = "accountType"
        case cardType = "cardType"
        case annualFees = "annualFees"
        case feeWaiver = "feeWaiver"
        case promoCode = "promoCode"
    }
}
// MARK: CreditCardsItemList Convenience Initializers & Mutators
extension CreditCardsItemList {
    init(data: Data) throws {
        self = try base_JSON_Decoder().decode(CreditCardsItemList.self, from: data)
    }
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    func with(
        isInstantCard: Bool?? = nil,
        title: String?? = nil,
        itemListDescription: String?? = nil,
        fullDescription: String?? = nil,
        img: String?? = nil,
        link: String?? = nil,
        buttonTitle: ButtonTitle?? = nil,
        type: PurpleType?? = nil,
        category: Category?? = nil,
        accountType: AccountType?? = nil,
        cardType: String?? = nil,
        annualFees: String?? = nil,
        feeWaiver: FeeWaiver?? = nil,
        promoCode: String?? = nil
        ) -> CreditCardsItemList {
        return CreditCardsItemList(
            isInstantCard: isInstantCard ?? self.isInstantCard,
            title: title ?? self.title,
            itemListDescription: itemListDescription ?? self.itemListDescription,
            fullDescription: fullDescription ?? self.fullDescription,
            img: img ?? self.img,
            link: link ?? self.link,
            buttonTitle: buttonTitle ?? self.buttonTitle,
            type: type ?? self.type,
            category: category ?? self.category,
            accountType: accountType ?? self.accountType,
            cardType: cardType ?? self.cardType,
            annualFees: annualFees ?? self.annualFees,
            feeWaiver: feeWaiver ?? self.feeWaiver,
            promoCode: promoCode ?? self.promoCode
        )
    }
    func jsonData() throws -> Data {
        return try base_JSON_Encoder().encode(self)
    }
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
enum AccountType: String, Codable {
    case empty = ""
    case the001 = "001"
}
enum ButtonTitle: String, Codable {
    case apply = "Apply"
    case findOutMore = "Find out more"
}
enum Category: String, Codable {
    case rebates = "Rebates"
    case rewards = "Rewards"
    case travel = "Travel"
}
enum FeeWaiver: String, Codable {
    case empty = ""
    case the1Y = "1Y"
}
enum PurpleType: String, Codable {
    case creditCards = "credit-cards"
}

// MARK: - Deposits
struct Deposits: Codable {
    let bannerImg: String?
    let bannerLink: String?
    let headerTitle: String?
    let itemList: [DepositsItemList]?
    enum CodingKeys: String, CodingKey {
        case bannerImg
        case bannerLink
        case headerTitle
        case itemList
    }
}
// MARK: Deposits Convenience Initializers & Mutators
extension Deposits {
    init(data: Data) throws {
        self = try base_JSON_Decoder().decode(Deposits.self, from: data)
    }
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    func with(
        bannerImg: String?? = nil,
        bannerLink: String?? = nil,
        headerTitle: String?? = nil,
        itemList: [DepositsItemList]?? = nil
        ) -> Deposits {
        return Deposits(
            bannerImg: bannerImg ?? self.bannerImg,
            bannerLink: bannerLink ?? self.bannerLink,
            headerTitle: headerTitle ?? self.headerTitle,
            itemList: itemList ?? self.itemList
        )
    }
    func jsonData() throws -> Data {
        return try base_JSON_Encoder().encode(self)
    }
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
// MARK: - DepositsItemList
struct DepositsItemList: Codable {
    let title: String?
    let itemListDescription: String?
    let fullDescription: String?
    let img: String?
    let link: String?
    let buttonTitle: ButtonTitle?
    let type: FluffyType?
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case itemListDescription = "description"
        case fullDescription = "fullDescription"
        case img = "img"
        case link = "link"
        case buttonTitle = "buttonTitle"
        case type = "type"
    }
}
// MARK: DepositsItemList Convenience Initializers & Mutators
extension DepositsItemList {
    init(data: Data) throws {
        self = try base_JSON_Decoder().decode(DepositsItemList.self, from: data)
    }
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    func with(
        title: String?? = nil,
        itemListDescription: String?? = nil,
        fullDescription: String?? = nil,
        img: String?? = nil,
        link: String?? = nil,
        buttonTitle: ButtonTitle?? = nil,
        type: FluffyType?? = nil
        ) -> DepositsItemList {
        return DepositsItemList(
            title: title ?? self.title,
            itemListDescription: itemListDescription ?? self.itemListDescription,
            fullDescription: fullDescription ?? self.fullDescription,
            img: img ?? self.img,
            link: link ?? self.link,
            buttonTitle: buttonTitle ?? self.buttonTitle,
            type: type ?? self.type
        )
    }
    func jsonData() throws -> Data {
        return try base_JSON_Encoder().encode(self)
    }
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
enum FluffyType: String, Codable {
    case depositBundle = "deposit-bundle"
    case insurance = "insurance"
    case loans = "loans"
}
// MARK: - Termsandconditions
struct Termsandconditions: Codable {
    let title1: String?
    let desc1: String?
    let title2: String?
    let desc2: String?
    enum CodingKeys: String, CodingKey {
        case title1
        case desc1
        case title2
        case desc2
    }
}
// MARK: Termsandconditions Convenience Initializers & Mutators
extension Termsandconditions {
    init(data: Data) throws {
        self = try base_JSON_Decoder().decode(Termsandconditions.self, from: data)
    }
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    func with(
        title1: String?? = nil,
        desc1: String?? = nil,
        title2: String?? = nil,
        desc2: String?? = nil
        ) -> Termsandconditions {
        return Termsandconditions(
            title1: title1 ?? self.title1,
            desc1: desc1 ?? self.desc1,
            title2: title2 ?? self.title2,
            desc2: desc2 ?? self.desc2
        )
    }
    func jsonData() throws -> Data {
        return try base_JSON_Encoder().encode(self)
    }
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
// MARK: - Helper functions for Creating Encoders & Decoders
func base_JSON_Decoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}
func base_JSON_Encoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
