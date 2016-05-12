//
//  StateAbbreviationType.swift
//  EDUGrader
//
//  Created by Elliot Grafil on 3/29/16.
//  Copyright © 2016 Elliot Grafil. All rights reserved.
//

import Foundation

enum StateAbbreviationType:Int, EnumProtocols {
    case AL = 0
    case AK = 1
    case AZ = 2
    case AR = 3
    case CA = 4
    case CO = 5
    case CT = 6
    case DC = 100
    case DE = 7
    case FL = 8
    case GA = 9
    case HI = 10
    case ID = 11
    case IL = 12
    case IN = 13
    case IA = 14
    case KS = 15
    case KY = 16
    case LA = 17
    case ME = 18
    case MD = 19
    case MA = 20
    case MI = 21
    case MN = 22
    case MS = 23
    case MO = 24
    case MT = 25
    case NE = 26
    case NV = 27
    case NH = 28
    case NJ = 29
    case NM = 30
    case NY = 31
    case NC = 32
    case ND = 33
    case OH = 34
    case OK = 35
    case OR = 36
    case PA = 37
    case RI = 38
    case SC = 39
    case SD = 40
    case TN = 41
    case TX = 42
    case UT = 43
    case VT = 44
    case VA = 45
    case WA = 46
    case WV = 47
    case WI = 48
    case WY = 49
    //Commonwealth/Territory:
    case AS = 101
    case FM = 102
    case GU = 103
    case MH = 104
    case MP = 105
    case PW = 106
    case PR = 107
    case VI = 108
    
    
    
    var description: String {
        switch self {
        case .AL: return "AL"
        case .AK: return "AK"
        case .AZ: return "AZ"
        case .AR: return "AR"
        case .CA: return "CA"
        case .CO: return "CO"
        case .CT: return "CT"
        case .DC: return "DC"
        case .DE: return "DE"
        case .FL: return "FL"
        case .GA: return "GA"
        case .HI: return "HI"
        case .ID: return "ID"
        case .IL: return "IL"
        case .IN: return "IN"
        case .IA: return "IA"
        case .KS: return "KS"
        case .KY: return "KY"
        case .LA: return "LA"
        case .ME: return "ME"
        case .MD: return "MD"
        case .MA: return "MA"
        case .MI: return "MI"
        case .MN: return "MN"
        case .MS: return "MS"
        case .MO: return "MO"
        case .MT: return "MT"
        case .NE: return "NE"
        case .NV: return "NV"
        case .NH: return "NH"
        case .NJ: return "NJ"
        case .NM: return "NM"
        case .NY: return "NY"
        case .NC: return "NC"
        case .ND: return "ND"
        case .OH: return "OH"
        case .OK: return "OK"
        case .OR: return "OR"
        case .PA: return "PA"
        case .RI: return "RI"
        case .SC: return "SC"
        case .SD: return "SD"
        case .TN: return "TN"
        case .TX: return "TX"
        case .UT: return "UT"
        case .VT: return "VT"
        case .VA: return "VA"
        case .WA: return "WA"
        case .WV: return "WV"
        case .WI: return "WI"
        case .WY: return "WY"
            //Commonwealth/Territory:
        case .AS: return "AS"
        case .FM: return "FM"
        case .GU: return "GU"
        case .MH: return "MH"
        case .MP: return "MP"
        case .PW: return "PW"
        case .PR: return "PR"
        case .VI: return "VI"
        }
    }
    
    init?(description: String) {
        switch description {
        case "AL":                              self = .AL
        case "AK":                              self = .AK
        case "AZ":                              self = .AZ
        case "AR":                              self = .AR
        case "CA":                              self = .CA
        case "CO":                              self = .CO
        case "CT":                              self = .CT
        case "DC":                              self = .DC
        case "DE":                              self = .DE
        case "FL":                              self = .FL
        case "GA":                              self = .GA
        case "HI":                              self = .HI
        case "ID":                              self = .ID
        case "IL":                              self = .IL
        case "IN":                              self = .IN
        case "IA":                              self = .IA
        case "KS":                              self = .KS
        case "KY":                              self = .KY
        case "LA":                              self = .LA
        case "ME":                              self = .ME
        case "MD":                              self = .MD
        case "MA":                              self = .MA
        case "MI":                              self = .MI
        case "MN":                              self = .MN
        case "MS":                              self = .MS
        case "MO":                              self = .MO
        case "MT":                              self = .MT
        case "NE":                              self = .NE
        case "NV":                              self = .NV
        case "NH":                              self = .NH
        case "NJ":                              self = .NJ
        case "NM":                              self = .NM
        case "NY":                              self = .NY
        case "NC":                              self = .NC
        case "ND":                              self = .ND
        case "OH":                              self = .OH
        case "OK":                              self = .OK
        case "OR":                              self = .OR
        case "PA":                              self = .PA
        case "RI":                              self = .RI
        case "SC":                              self = .SC
        case "SD":                              self = .SD
        case "TN":                              self = .TN
        case "TX":                              self = .TX
        case "UT":                              self = .UT
        case "VT":                              self = .VT
        case "VA":                              self = .VA
        case "WA":                              self = .WA
        case "WV":                              self = .WV
        case "WI":                              self = .WI
        case "WY":                              self = .WY
            //Commonwealth/Territory:
        case "AS":                              self = .AS
        case "FM":                              self = .FM
        case "GU":                              self = .GU
        case "MH":                              self = .MH
        case "MP":                              self = .MP
        case "PW":                              self = .PW
        case "PR":                              self = .PR
        case "VI":                              self = .VI
        default:                                return nil
        }
    }
    static var allValues:[StateType] { return [.AL,
        .AK,
        .AZ,
        .AR,
        .CA,
        .CO,
        .CT,
        .DC,
        .DE,
        .FL,
        .GA,
        .HI,
        .ID,
        .IL,
        .IN,
        .IA,
        .KS,
        .KY,
        .LA,
        .ME,
        .MD,
        .MA,
        .MI,
        .MN,
        .MS,
        .MO,
        .MT,
        .NE,
        .NV,
        .NH,
        .NJ,
        .NM,
        .NY,
        .NC,
        .ND,
        .OH,
        .OK,
        .OR,
        .PA,
        .RI,
        .SC,
        .SD,
        .TN,
        .TX,
        .UT,
        .VT,
        .VA,
        .WA,
        .WV,
        .WI,
        .WY,
        //Commonwealth/Territory:
        .AS,
        .FM,
        .GU,
        .MH,
        .MP,
        .PW,
        .PR,
        .VI] }
}









