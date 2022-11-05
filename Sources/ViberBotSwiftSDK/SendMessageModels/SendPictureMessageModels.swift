//
//  File.swift
//  
//
//  Created by Pavel Trafimuk on 04/11/2022.
//

import Foundation

// for high-level sender
public struct PictureMessageRequestModel {
    public let text: String
    public let media: URL
    public let thumbnail: URL?

    public let receiver: String // emid?
    public let sender: SenderInfo
    public let trackingData: String?
}

// for request body
public struct PictureMessageInternalRequestModel: Codable, SendMessageInternalRequestCommonValues {
    public let text: String
    public let media: URL
    
    // Recommended: 400x400. Max size: 100kb.
    public let thumbnail: URL?

    public let receiver: String // emid?
    public let messageType: MessageType = .picture
    public let sender: SenderInfo
    public let trackingData: String?
    
    public let minApiVersion: Int = 3 // TODO: use latest one
    public let authToken: String
    
    public enum CodingKeys: String, CodingKey {
        case text
        case media
        case thumbnail
        case receiver
        case messageType
        case sender
        case authToken = "auth_token"
        case trackingData = "tracking_data"
        case minApiVersion = "min_api_version"
    }
}
