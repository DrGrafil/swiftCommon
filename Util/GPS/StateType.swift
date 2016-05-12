//
//  StateEnum.swift
//  EDUGrader
//
//  Created by Elliot Grafil on 3/29/16.
//  Copyright © 2016 Elliot Grafil. All rights reserved.
//

import Foundation


enum StateType:Int, EnumProtocols {
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
        case .AL: return "Alabama"
        case .AK: return "Alaska"
        case .AZ: return "Arizona"
        case .AR: return "Arkansas"
        case .CA: return "California"
        case .CO: return "Colorado"
        case .CT: return "Connecticut"
        case .DC: return "District of Columbia"
        case .DE: return "Delaware"
        case .FL: return "Florida"
        case .GA: return "Georgia"
        case .HI: return "Hawaii"
        case .ID: return "Idaho"
        case .IL: return "Illinois"
        case .IN: return "Indiana"
        case .IA: return "Iowa"
        case .KS: return "Kansas"
        case .KY: return "Kentucky"
        case .LA: return "Louisiana"
        case .ME: return "Maine"
        case .MD: return "Maryland"
        case .MA: return "Massachusetts"
        case .MI: return "Michigan"
        case .MN: return "Minnesota"
        case .MS: return "Mississippi"
        case .MO: return "Missouri"
        case .MT: return "Montana"
        case .NE: return "Nebraska"
        case .NV: return "Nevada"
        case .NH: return "New Hampshire"
        case .NJ: return "New Jersey"
        case .NM: return "New Mexico"
        case .NY: return "New York"
        case .NC: return "North Carolina"
        case .ND: return "North Dakota"
        case .OH: return "Ohio"
        case .OK: return "Oklahoma"
        case .OR: return "Oregon"
        case .PA: return "Pennsylvania"
        case .RI: return "Rhode Island"
        case .SC: return "South Carolina"
        case .SD: return "South Dakota"
        case .TN: return "Tennessee"
        case .TX: return "Texas"
        case .UT: return "Utah"
        case .VT: return "Vermont"
        case .VA: return "Virginia"
        case .WA: return "Washington"
        case .WV: return "West Virginia"
        case .WI: return "Wisconsin"
        case .WY: return "Wyoming"
            //Commonwealth/Territory:
        case .AS: return "American Samoa"
        case .FM: return "Federated States of Micronesia"
        case .GU: return "Guam"
        case .MH: return "Marshall Islands"
        case .MP: return "Northern Mariana Islands"
        case .PW: return "Palau"
        case .PR: return "Puerto Rico"
        case .VI: return "Virgin Islands"
        }
    }
    
    init?(description: String) {
        switch description {
        case "Alabama":                         self = .AL
        case "Alaska":                          self = .AK
        case "Arizona":                         self = .AZ
        case "Arkansas":                        self = .AR
        case "California":                      self = .CA
        case "Colorado":                        self = .CO
        case "Connecticut":                     self = .CT
        case "District of Columbia":            self = .DC
        case "Delaware":                        self = .DE
        case "Florida":                         self = .FL
        case "Georgia":                         self = .GA
        case "Hawaii":                          self = .HI
        case "Idaho":                           self = .ID
        case "Illinois":                        self = .IL
        case "Indiana":                         self = .IN
        case "Iowa":                            self = .IA
        case "Kansas":                          self = .KS
        case "Kentucky":                        self = .KY
        case "Louisiana":                       self = .LA
        case "Maine":                           self = .ME
        case "Maryland":                        self = .MD
        case "Massachusetts":                   self = .MA
        case "Michigan":                        self = .MI
        case "Minnesota":                       self = .MN
        case "Mississippi":                     self = .MS
        case "Missouri":                        self = .MO
        case "Montana":                         self = .MT
        case "Nebraska":                        self = .NE
        case "Nevada":                          self = .NV
        case "New Hampshire":                   self = .NH
        case "New Jersey":                      self = .NJ
        case "New Mexico":                      self = .NM
        case "New York":                        self = .NY
        case "North Carolina":                  self = .NC
        case "North Dakota":                    self = .ND
        case "Ohio":                            self = .OH
        case "Oklahoma":                        self = .OK
        case "Oregon":                          self = .OR
        case "Pennsylvania":                    self = .PA
        case "Rhode Island":                    self = .RI
        case "South Carolina":                  self = .SC
        case "South Dakota":                    self = .SD
        case "Tennessee":                       self = .TN
        case "Texas":                           self = .TX
        case "Utah":                            self = .UT
        case "Vermont":                         self = .VT
        case "Virginia":                        self = .VA
        case "Washington":                      self = .WA
        case "West Virginia":                   self = .WV
        case "Wisconsin":                       self = .WI
        case "Wyoming":                         self = .WY
        //Commonwealth/Territory:
        case "American Samoa":                  self = .AS
        case "Federated States of Micronesia":  self = .FM
        case "Guam":                            self = .GU
        case "Marshall Islands":                self = .MH
        case "Northern Mariana Islands":        self = .MP
        case "Palau":                           self = .PW
        case "Puerto Rico":                     self = .PR
        case "Virgin Islands":                  self = .VI
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









