//
//  Model.swift
//  Starter Project
//
//  Created by MOHAMED ABD ELHAMED AHMED on 28/03/2023.
//

import Foundation

struct PhotosAlbumElement: Codable {
    var id: String?
    var createdAt, updatedAt: String?
    var promotedAt: String?
    var width, height: Int?
    var color, blurHash: String?
    var description: String?
    var altDescription: String?
    var urls: Urls?
    var links: PhotosAlbumLinks?
    var likes: Int?
    var likedByUser: Bool?
    var currentUserCollections: [String]?
    var sponsorship: Sponsorship?
    var topicSubmissions: TopicSubmissions?
    var user: User?

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case promotedAt = "promoted_at"
        case width, height, color
        case blurHash = "blur_hash"
        case description
        case altDescription = "alt_description"
        case urls, links, likes
        case likedByUser = "liked_by_user"
        case currentUserCollections = "current_user_collections"
        case sponsorship
        case topicSubmissions = "topic_submissions"
        case user
    }
}

// MARK: - PhotosAlbumLinks
struct PhotosAlbumLinks: Codable {
    var linksSelf, html, download, downloadLocation: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }
}

// MARK: - Sponsorship
struct Sponsorship: Codable {
    var impressionUrls: [String]?
    var tagline: String?
    var taglineURL: String?
    var sponsor: User?

    enum CodingKeys: String, CodingKey {
        case impressionUrls = "impression_urls"
        case tagline
        case taglineURL = "tagline_url"
        case sponsor
    }
}

// MARK: - User
struct User: Codable {
    var id: String?
    var updatedAt: String?
    var username, name, firstName: String?
    var lastName, twitterUsername: String?
    var portfolioURL: String?
    var bio, location: String?
    var links: UserLinks?
    var profileImage: ProfileImage?
    var instagramUsername: String?
    var totalCollections, totalLikes, totalPhotos: Int?
    var acceptedTos, forHire: Bool?
    var social: Social?

    enum CodingKeys: String, CodingKey {
        case id
        case updatedAt = "updated_at"
        case username, name
        case firstName = "first_name"
        case lastName = "last_name"
        case twitterUsername = "twitter_username"
        case portfolioURL = "portfolio_url"
        case bio, location, links
        case profileImage = "profile_image"
        case instagramUsername = "instagram_username"
        case totalCollections = "total_collections"
        case totalLikes = "total_likes"
        case totalPhotos = "total_photos"
        case acceptedTos = "accepted_tos"
        case forHire = "for_hire"
        case social
    }
}

// MARK: - UserLinks
struct UserLinks: Codable {
    var linksSelf, html, photos, likes: String?
    var portfolio, following, followers: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes, portfolio, following, followers
    }
}

// MARK: - ProfileImage
struct ProfileImage: Codable {
    var small, medium, large: String?
}

// MARK: - Social
struct Social: Codable {
    var instagramUsername: String?
    var portfolioURL: String?
    var twitterUsername: String?
    var paypalEmail: String?

    enum CodingKeys: String, CodingKey {
        case instagramUsername = "instagram_username"
        case portfolioURL = "portfolio_url"
        case twitterUsername = "twitter_username"
        case paypalEmail = "paypal_email"
    }
}

// MARK: - TopicSubmissions
struct TopicSubmissions: Codable {
    var architectureInterior: ArchitectureInterior?
    var streetPhotography: StreetPhotography?

    enum CodingKeys: String, CodingKey {
        case architectureInterior = "architecture-interior"
        case streetPhotography = "street-photography"
    }
}

// MARK: - ArchitectureInterior
struct ArchitectureInterior: Codable {
    var status: String?
    var approvedOn: String?

    enum CodingKeys: String, CodingKey {
        case status
        case approvedOn = "approved_on"
    }
}

// MARK: - StreetPhotography
struct StreetPhotography: Codable {
    var status: String?
}

// MARK: - Urls
struct Urls: Codable {
    var raw, full, regular, small: String?
    var thumb, smallS3: String?

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}

typealias PhotosAlbum = [PhotosAlbumElement]
