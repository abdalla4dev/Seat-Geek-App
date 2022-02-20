//
//  Date+Ext.swift
//  Seat-Geek-App
//
//  Created by abdallah ragab on 20/02/2022.
//

import Foundation

public extension Date {
    
    enum DateStringRepresentation: String, CaseIterable {
        /// ISO 8601 Data elements and interchange formats –
        /// Information interchange – Representation of dates and times
        /// is an international standard covering the exchange of date-
        /// and time-related data. It was issued by the International
        /// Organization for Standardization (ISO) and
        ///  was first published in 1988.
        ///
        /// [wiki link](https://en.wikipedia.org/wiki/ISO_8601)
        ///
        /// ### Sample
        ///       2020-07-10T00:47:28.335884+00:00
        ///       2001-01-01T01:01:01.000001+00:00
        case iso8601Full = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSz"
        case isoZ8601Full = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        /// 2020-10-11T09:15:00Z
        /// 2020-09-21T12:00:00Z
        case isoWithZ8601Full = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        //        2021-08-05T05:30
        case isoWithoutMinTimeZone = "yyyy-MM-dd'T'HH:mm"
        
        /// 2021-02-20T00:00:00.000Z
        case isoWithZ8601FullVaccine = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        /// 2020-09-21T12:00:00Z
        case isoWithoutZ8601Full = "yyyy-MM-dd'T'HH:mm:ss"
        
        /// 2021-01-17T15:40:35.8
        case isoWithSC8601Full = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        
        /// 06:59.AM 12-03-2020
        case dot_hhmma_dash_ddMMyyyy = "hh:mm.a dd-MM-yyyy"
        
        /// 12:59
        case HHmm = "HH:mm"
        
        /// 07:16 AM
        case hhMMa = "hh:mm a"
        
        case HHmmssSSSSSSS = "HH:mm:ss.SSSSSSS"
        /// 07:18:03
        case HHmmss = "HH:mm:ss"
        /// 2020-03-12
        case yyyyMMdd = "yyyy-MM-dd"
        
        case yyyyMMddHHmmssSSSSSSS = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSS"
        /// 2020-03
        case yyyyMM = "yyyy-MM"
        
        /// 2020-03-12 07:23:16
        case yyyyMMddHHmmss = "yyyy-MM-dd HH:mm:ss"
        
        
        /// 12-March
        case ddMM = "dd-MMMM"
        
        /// 12 Mar "dd/MM/yyyy HH:mm"
        case ddSpaceMM = "dd MMM"
        
        /// 12 Mar
        case mmmSpacedd = "MMM dd"
        
        /// "dd/MM/yyyy HH:mm"
        case ddMMyyyyHHmm = "dd/MM/yyyy HH:mm"
        
        /// 12-03-2020
        case ddMMyyyy = "dd-MM-yyyy"
        
        
        
        /// 12 March, 2020
        case ddMMMMyyyy = "dd MMMM, yyyy"
        
        /// 12 Mar, 2020
        case ddMMMyyyy = "dd MMM, yyyy"
        
        /// 12-March-2020-Thursday
        case ddMMMMyyyyEEEE = "dd-MMMM-yyyy-EEEE"
        case ddMMMMyyyyEEEESpaces = " EEEE dd MMMM yyyy"
        
        /// 12-March-2020-Thursday
        case ddMMMMyyyyDASH = "dd-MMMM-yyyy"
        
        /// 12/03/2020
        case dd_slash_MM_slash_yyyy = "dd/MM/yyyy"
        
        /// 2020-07-12
        case YYYYMMDD = "yyyy/MM/dd"
        
        /// 12, March
        case ddMMMM = "d, MMMM"
        
        /// March 12
        case MMMMd = "MMMM d"
        
        /// March 12, 2020
        case MMMMdYYYY = "MMMM dd, yyyy"
        
        /// March
        case MMMM
        
        /// March, 2020
        case MMMMyyyy = "MMMM, yyyy"
        
        /// Thursday - Mar 12
        case EEEEMMMd = "EEEE - MMM d"
        
        // Thursday - Mar 12
        case MMSPEEEE = "MM EEEE"
        
        /// Thursday Mar 12
        case EEEEMMMdd = "EEEE MMM dd"
        
        /// Thursday, 03/12/2020
        case EEEEMMddyyyy = "EEEE, MM/dd/yyyy"
        
        /// Thursday, 12/03/2020
        case EEEEddMMyyyy = "EEEE, dd/MM/yyyy"
        
        /// Thursday, March 12, 2020 - 07:46
        case EEEEMMMMddyyyyhhmm = "EEEE, MMMM dd, yyyy - HH:mm"
        case EEEEMMMMddyyyyhhmma = "EEEE, MMMM dd, yyyy - HH:mm a"
        
        /// Thursday, 12/3, 07:47 AM
        case EEEEddMHHmma = "EEEE, dd/M, HH:mm a"
        case EEEEdMMMyyyyhmma = "EEEE, d MMM  yyyy  h:mm a"
        /// Thursday, 12/3
        case EEEEddMM = "EEEE, dd/M"
        
        /// Thursday
        case EEEE
        case EESMMSyyyyTime = "dd/MM/yyyy HH:mm a"
        
        case YYYYMMDDSpaceColSpcHHMMa = "yyyy-MM-dd | HH:mm a"
        case yyyyMdssSSZ = "yyyy-M-d'T'HH:mm:ss.SSS'Z'"
        /// 2016-06-03-22.00.00PM
        case yyyyMMddddMMyya = "yyyy-MM-dd-HH.mm.ssa"
        case MMSlashddSlashyyyySpaceHHmmss = "MM/dd/yyyy HH:mm:ss"
        case ddMMyyyyHHmmss = "dd/MM/yyyy HH:mm:ss"
    }
    
    
    func toString(_ format: DateStringRepresentation) -> String {
        toString(dateFormat: format.rawValue)
    }
    
    private func toString(dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.current
        
        let stringRepresentation = dateFormatter.string(from: self)
        return stringRepresentation
    }
    
}

public extension String {
    
    func toDate(format: Date.DateStringRepresentation) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.date(from: self)
    }
    
}

public extension DateFormatter {
    class func prepareFor(_ format: Date.DateStringRepresentation) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }
}
