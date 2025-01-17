//
//  File.swift
//  
//
//  Created by Pavel Trafimuk on 11/2/22.
//

import Foundation

public struct SetWebhookRequestModel: Codable {
    public init(url: String, authToken: String, eventTypes: [CallbackEventType]? = nil, sendName: Bool, sendPhoto: Bool) {
        self.url = url
        self.authToken = authToken
        self.eventTypes = eventTypes
        self.sendName = sendName
        self.sendPhoto = sendPhoto
    }
    
    // your URL, which supports HTTPS&SSL and returns OK-200 on empty post request
    public let url: String
    
    public let authToken: String
    
    // nil for alls
    public let eventTypes: [CallbackEventType]?
    
    // Indicates whether or not the bot should receive the user name. Default false
    public let sendName: Bool
    
    // Indicates whether or not the bot should receive the user photo. Default false
    public let sendPhoto: Bool
    
    public enum CodingKeys: String, CodingKey {
        case url
        case authToken = "auth_token"
        case eventTypes = "event_types"
        case sendName = "send_name"
        case sendPhoto = "send_photo"
    }
}

public struct SetWebhookResponseModel: Codable {
    
    let status: ResponseStatus
    let statusMessage: String
    
    // TODO: add failable behavior, to decode even if event is unknown
    let eventTypes: [CallbackEventType]?
    
    public enum CodingKeys: String, CodingKey {
        case status
        case statusMessage = "status_message"
        case eventTypes = "event_types"
    }
}
