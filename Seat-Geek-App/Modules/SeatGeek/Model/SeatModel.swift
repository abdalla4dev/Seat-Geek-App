//
//  Model.swift
//  Seat-Geek-App
//
//  Created by abdallah ragab on 20/02/2022.
//
import Foundation

// MARK: - SeatModel
struct SeatModel: Codable {
    let meta: Meta?
    let events: [Event]?
}

// MARK: - Event
struct Event: Codable {
    let conditional: Bool?
    let datetimeLocal: String?
    let status: String?
    let title: String?
    let url: String?
    let datetimeTbd: Bool?
    let announcements: Announcements?
    let domainInformation: [String]?
    let score: Double?
    let performers: [Performer]?
    let themes: [String]?
    let isOpen: Bool?
    let links: [String]?
    let taxonomies: [Taxonomy]?
    let type: String?
    let eventPromotion: String?
    let id: Int?
    let visibleUntilUTC: String?
    let enddatetimeUTC: String?
    let venue: Venue?
    let timeTbd: Bool?
    let popularity: Double?
    let stats: EventStats?
    let dateTbd: Bool?
    let createdAt, datetimeUTC, shortTitle, announceDate: String
    let eventDescription: String?
    let generalAdmission: Bool?
    
    var _date: String? {
        let formate = Date.DateStringRepresentation.EEEEdMMMyyyyhmma
        if let date = datetimeLocal?.toDate(format: Date.DateStringRepresentation.isoWithoutZ8601Full) {
            return date.toString(formate)
        }
        return nil
        
    }
    enum CodingKeys: String, CodingKey {
        case conditional
        case datetimeLocal = "datetime_local"
        case status, title, url
        case datetimeTbd = "datetime_tbd"
        case announcements
        case domainInformation = "domain_information"
        case score, performers, themes
        case isOpen = "is_open"
        case links, taxonomies, type
        case eventPromotion = "event_promotion"
        case id
        case visibleUntilUTC = "visible_until_utc"
        case enddatetimeUTC = "enddatetime_utc"
        case venue
        case timeTbd = "time_tbd"
        case popularity, stats
        case dateTbd = "date_tbd"
        case createdAt = "created_at"
        case datetimeUTC = "datetime_utc"
        case shortTitle = "short_title"
        case announceDate = "announce_date"
        case eventDescription = "description"
        case generalAdmission = "general_admission"
    }
}

// MARK: - Announcements
struct Announcements: Codable {
}

// MARK: - Performer
struct Performer: Codable {
    let primary: Bool?
    let slug: String?
    let location: Location?
    let url: String?
    let image: String?
    let homeTeam: Bool?
    let imageLicense: String?
    let score: Double?
    let images: PerformerImages?
    let shortName: String?
    let taxonomies: [Taxonomy]?
    let name: String?
    let type: String?
    let homeVenueID: Int?
    let id: Int?
    let hasUpcomingEvents: Bool?
    let popularity: Int?
    let stats: PerformerStats?
    let numUpcomingEvents: Int?
    let imageAttribution: String?
    let awayTeam: Bool?
    let genres: [Genre]?
    
    enum CodingKeys: String, CodingKey {
        case primary, slug, location, url, image
        case homeTeam = "home_team"
        case imageLicense = "image_license"
        case score, images
        case shortName = "short_name"
        case taxonomies, name, type
        case homeVenueID = "home_venue_id"
        case id
        case hasUpcomingEvents = "has_upcoming_events"
        case popularity, stats
        case numUpcomingEvents = "num_upcoming_events"
        case imageAttribution = "image_attribution"
        case awayTeam = "away_team"
        case genres
    }
}

// MARK: - Genre
struct Genre: Codable {
    let slug: String?
    let primary: Bool?
    let images: GenreImages?
    let id: Int?
    let image: String?
    let documentSource: DocumentSource?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case slug, primary, images, id, image
        case documentSource = "document_source"
        case name
    }
}

// MARK: - DocumentSource
struct DocumentSource: Codable {
    let sourceType: String?
    let generationType: String?
    
    enum CodingKeys: String, CodingKey {
        case sourceType = "source_type"
        case generationType = "generation_type"
    }
}


// MARK: - GenreImages
struct GenreImages: Codable {
    let ipadHeader, the500_700, block, criteo130_160: String?
    let criteo205_100, huge, ipadEventModal, triggitFbAd: String?
    let fb100X72, squareMid, the800X320, ipadMiniExplore: String?
    let the136X136, criteo400_300, banner, mongo: String?
    let fb600_315, criteo170_235, the1200X525, the1200X627: String?
    
    enum CodingKeys: String, CodingKey {
        case ipadHeader = "ipad_header"
        case the500_700 = "500_700"
        case block
        case criteo130_160 = "criteo_130_160"
        case criteo205_100 = "criteo_205_100"
        case huge
        case ipadEventModal = "ipad_event_modal"
        case triggitFbAd = "triggit_fb_ad"
        case fb100X72 = "fb_100x72"
        case squareMid = "square_mid"
        case the800X320 = "800x320"
        case ipadMiniExplore = "ipad_mini_explore"
        case the136X136 = "136x136"
        case criteo400_300 = "criteo_400_300"
        case banner, mongo
        case fb600_315 = "fb_600_315"
        case criteo170_235 = "criteo_170_235"
        case the1200X525 = "1200x525"
        case the1200X627 = "1200x627"
    }
}

// MARK: - PerformerImages
struct PerformerImages: Codable {
    let huge: String?
}

// MARK: - Location
struct Location: Codable {
    let lat, lon: Double?
}

// MARK: - PerformerStats
struct PerformerStats: Codable {
    let eventCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case eventCount = "event_count"
    }
}

// MARK: - Taxonomy
struct Taxonomy: Codable {
    let parentID: Int?
    let id: Int?
    let documentSource: DocumentSource?
    let name: String?
    let rank: Int?
    
    enum CodingKeys: String, CodingKey {
        case parentID = "parent_id"
        case id
        case documentSource = "document_source"
        case name, rank
    }
}



// MARK: - EventStats
struct EventStats: Codable {
    let lowestSgBasePrice: Int?
    let lowestSgBasePriceGoodDeals: Int?
    let highestPrice, listingCount, averagePrice: Int?
    let lowestPriceGoodDeals: Int?
    let lowestPrice, visibleListingCount: Int?
    let dqBucketCounts: [Int]?
    let medianPrice: Int?
    
    enum CodingKeys: String, CodingKey {
        case lowestSgBasePrice = "lowest_sg_base_price"
        case lowestSgBasePriceGoodDeals = "lowest_sg_base_price_good_deals"
        case highestPrice = "highest_price"
        case listingCount = "listing_count"
        case averagePrice = "average_price"
        case lowestPriceGoodDeals = "lowest_price_good_deals"
        case lowestPrice = "lowest_price"
        case visibleListingCount = "visible_listing_count"
        case dqBucketCounts = "dq_bucket_counts"
        case medianPrice = "median_price"
    }
}



// MARK: - Venue
struct Venue: Codable {
    let location: Location?
    let slug, postalCode: String?
    let capacity: Int?
    let url: String?
    let country: String?
    let displayLocation: String?
    let score: Double?
    let city: String?
    let links: [String]?
    let name: String?
    let state: String?
    let id: Int?
    let hasUpcomingEvents: Bool?
    let nameV2: String?
    let metroCode: Int?
    let timezone: String?
    let popularity: Int?
    let extendedAddress: String?
    let numUpcomingEvents: Int?
    let address: String?
    
    enum CodingKeys: String, CodingKey {
        case location, slug
        case postalCode = "postal_code"
        case capacity, url, country
        case displayLocation = "display_location"
        case score, city, links, name
        case state, id
        case hasUpcomingEvents = "has_upcoming_events"
        case nameV2 = "name_v2"
        case metroCode = "metro_code"
        case timezone, popularity
        case extendedAddress = "extended_address"
        case numUpcomingEvents = "num_upcoming_events"
        case address
    }
}

// MARK: - Meta
struct Meta: Codable {
    let page: Int?
    let geolocation: String?
    let perPage, total, took: Int?
    
    enum CodingKeys: String, CodingKey {
        case page, geolocation
        case perPage = "per_page"
        case total, took
    }
}
