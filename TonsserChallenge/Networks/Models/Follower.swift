//
//  Follower.swift
//  TonsserChallenge
//
//  Created by Ahmed CHEBBI on 10/07/2020.
//  Copyright © 2020 Tonsser. All rights reserved.
//

import Foundation


// MARK: - Response
struct Follower: Codable {
    let slug, name, firstname, lastname: String?
    let facebookID: String?
    let roleID, primaryPositionID, countryID: Int?
    let gender: Gender?
    let email: String?
    let profilePicture: String?
    let googleID, digitsID, phoneNumber: String?
    let topPlayer: Bool?
    let createdAt: String?
    let accountKitID: String?
    let isCoach: Bool?
    let coachTeamSlugs: [String]?
    let role: String?
    let isVerified, anonymous, inForm: Bool?
    let id: Int?
    let firebaseID: String?
    let isFollowing: Bool?
    let primaryPosition: PrimaryPosition?
    let club: Club?
    let team: Team?

    enum CodingKeys: String, CodingKey {
        case slug, name, firstname, lastname
        case facebookID = "facebook_id"
        case roleID = "role_id"
        case primaryPositionID = "primary_position_id"
        case countryID = "country_id"
        case gender, email
        case profilePicture = "profile_picture"
        case googleID = "google_id"
        case digitsID = "digits_id"
        case phoneNumber = "phone_number"
        case topPlayer = "top_player"
        case createdAt = "created_at"
        case accountKitID = "account_kit_id"
        case isCoach = "is_coach"
        case coachTeamSlugs = "coach_team_slugs"
        case role
        case isVerified = "is_verified"
        case anonymous
        case inForm = "in_form"
        case id
        case firebaseID = "firebase_id"
        case isFollowing = "is_following"
        case primaryPosition = "primary_position"
        case club, team
    }
}

// MARK: - Club
struct Club: Codable {
    let slug, name: String?
    let logoURL: String?

    enum CodingKeys: String, CodingKey {
        case slug, name
        case logoURL = "logo_url"
    }
}

enum Gender: String, Codable {
    case male = "male"
    case unknown = "unknown"
    case female = "female"
}

// MARK: - PrimaryPosition
struct PrimaryPosition: Codable {
    let id: Int?
    let abbreviation, name: String?
    let order, group: Int?
    let coordinates: Coordinates?
    let positionGroupID: Int?
    let localizedName, localizedAbbreviation: String?

    enum CodingKeys: String, CodingKey {
        case id, abbreviation, name, order, group, coordinates
        case positionGroupID = "position_group_id"
        case localizedName = "localized_name"
        case localizedAbbreviation = "localized_abbreviation"
    }
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let x, y: Double?
}
 
// MARK: - Team
struct Team: Codable {
    let id: Int?
    let clubName: String?
    let crowdSourced, crowdsourced: Bool?
    let displayName: String?
    let isCrowdsourced: Bool?
    let leagueName, leagueSlug, name: String?
    let requirePermissionToJoin: Bool?
    let season: Season?
    let slug: String?
    let playersCount, numberOfCoaches: Int?
    let league: League?
    let club: Club?

    enum CodingKeys: String, CodingKey {
        case id
        case clubName = "club_name"
        case crowdSourced = "crowd_sourced"
        case crowdsourced
        case displayName = "display_name"
        case isCrowdsourced = "is_crowdsourced"
        case leagueName = "league_name"
        case leagueSlug = "league_slug"
        case name
        case requirePermissionToJoin = "require_permission_to_join"
        case season, slug
        case playersCount = "players_count"
        case numberOfCoaches = "number_of_coaches"
        case league, club
    }
}

// MARK: - League
struct League: Codable {
    let name, slug: String?
    let id: Int?
    let level: Int?
    let leaguePlayerCount: Int?

    enum CodingKeys: String, CodingKey {
        case name, slug, id, level
        case leaguePlayerCount = "league_player_count"
    }
}

// MARK: - Season
struct Season: Codable {
    let start, end: String?
}
