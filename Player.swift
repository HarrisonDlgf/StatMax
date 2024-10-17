//
//  Player.swift
//  NoblesStatsMax
//
//  Created by Harrison on 2/6/23.
//

import Foundation
import CoreData

//Request these variables from the coach
@objc(Player)
public class Player: NSManagedObject, Identifiable {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }
    //GENERAL
    @NSManaged public var name: String
    @NSManaged public var hits: Int32
    @NSManaged public var atBats: Int32
    @NSManaged public var walks: Int32
    @NSManaged public var hbp: Int32
    @NSManaged public var sacrifices: Int32
    @NSManaged public var singles: Int32
    @NSManaged public var doubles: Int32
    @NSManaged public var triples: Int32
    @NSManaged public var homeRuns: Int32
    @NSManaged public var runs: Int32
    @NSManaged public var rbis: Int32
    @NSManaged public var k: Int32

    //LEFT
    @NSManaged public var hitsLeft: Int32
    @NSManaged public var atBatsLeft: Int32
    @NSManaged public var walksLeft: Int32
    @NSManaged public var hbpLeft: Int32
    @NSManaged public var sacrificesLeft: Int32
    @NSManaged public var singlesLeft: Int32
    @NSManaged public var doublesLeft: Int32
    @NSManaged public var triplesLeft: Int32
    @NSManaged public var homeRunsLeft: Int32
    @NSManaged public var runsLeft: Int32
    @NSManaged public var rbisLeft: Int32
    @NSManaged public var kLeft: Int32
    //RIGHT
    @NSManaged public var hitsRight: Int32
    @NSManaged public var atBatsRight: Int32
    @NSManaged public var walksRight: Int32
    @NSManaged public var hbpRight: Int32
    @NSManaged public var sacrificesRight: Int32
    @NSManaged public var singlesRight: Int32
    @NSManaged public var doublesRight: Int32
    @NSManaged public var triplesRight: Int32
    @NSManaged public var homeRunsRight: Int32
    @NSManaged public var runsRight: Int32
    @NSManaged public var rbisRight: Int32
    @NSManaged public var kRight: Int32
    //EQUATIONS
    var average: Double {
        get {
            guard atBats != 0 && hits <= atBats else {
                return 0
            }
            return (Double(hits) / Double(atBats)) * 1000
        }
        set { }
    }
    var averageLeft: Double {
        get {
            guard atBatsLeft != 0 && hitsLeft <= atBatsLeft else {
                return 0
            }
            return (Double(hitsLeft) / Double(atBatsLeft)) * 1000
        }
        set { }
    }
    var averageRight: Double {
        get {
            guard atBatsRight != 0 && hitsRight <= atBatsRight else {
                return 0
            }
            return (Double(hitsRight) / Double(atBatsRight)) * 1000
        }
        set { }
    }
//
    var plateAppearances: Int {
        get { Int(atBats + walks + hbp + sacrifices) }
        set { }
    }
    var plateAppearancesLeft: Int {
        get { Int(atBatsLeft + walksLeft + hbpLeft + sacrificesLeft) }
        set { }
    }
    var plateAppearancesRight: Int {
        get { Int(atBatsRight + walksRight + hbpRight + sacrificesRight) }
        set { }
    }
    var OBP: Double {
        get {
            guard (atBats + walks + hbp + sacrifices) != 0 else {
                return 0
            }
            let numerator = Double(hits + walks + hbp)
            let denominator = Double(atBats + walks + hbp + sacrifices)
            return ((numerator/denominator) * 1000)
        }
        set { }
    }
    var OBPLeft: Double {
        get {
            guard (atBatsLeft + walksLeft + hbpLeft + sacrificesLeft) != 0 else {
                return 0
            }
            let numeratorLeft = Double(hitsLeft + walksLeft + hbpLeft)
            let denominatorLeft = Double(atBatsLeft + walksLeft + hbpLeft + sacrificesLeft)
            return ((numeratorLeft/denominatorLeft) * 1000)
        }
        set { }
    }
    var OBPRight: Double {
        get {
            guard (atBatsRight + walksRight + hbpRight + sacrificesRight) != 0 else {
                return 0
            }
            let numeratorRight = Double(hitsRight + walksRight + hbpRight)
            let denominatorRight = Double(atBatsRight + walksRight + hbpRight + sacrificesRight)
            return ((numeratorRight/denominatorRight) * 1000)
        }
        set { }
    }
    var TB: Int {
        get {
            Int(singles + (2 * doubles) + (3 * triples) + (4 * homeRuns))
        }
    }
    var TBLeft: Int {
        get {
            Int(singlesLeft + (2 * doublesLeft) + (3 * triplesLeft) + (4 * homeRunsLeft))
        }
    }
    var TBRight: Int {
        get {
            Int(singlesRight + (2 * doublesRight) + (3 * triplesRight) + (4 * homeRunsRight))
        }
    }
    var kRate: Double {
        get {
            guard plateAppearances != 0 else {
                return 0
            }
            return (Double(k) / Double(plateAppearances)) * 100
        }
    }
    var kRateLeft: Double {
        get {
            guard plateAppearances != 0 else {
                return 0
            }
            return (Double(kLeft) / Double(plateAppearancesLeft)) * 100
        }
    }
    var kRateRight: Double {
        get {
            guard plateAppearances != 0 else {
                return 0
            }
            return (Double(kRight) / Double(plateAppearancesRight)) * 100
        }
    }
    var bbRate: Double {
        get {
            guard plateAppearances != 0 else {
                return 0
            }
            return (Double(walks) / Double(plateAppearances)) * 100
        }
    }
    var bbRateLeft: Double {
        get {
            guard plateAppearances != 0 else {
                return 0
            }
            return (Double(walksLeft) / Double(plateAppearancesLeft)) * 100
        }
    }
    var bbRateRight: Double {
        get {
            guard plateAppearances != 0 else {
                return 0
            }
            return (Double(walksRight) / Double(plateAppearancesRight)) * 100
        }
    }
    var SLG: Double {
        get {
            guard atBats != 0 else {
                return 0
            }
            let totalBases = Double(singles + (2 * doubles) + (3 * triples) + (4 * homeRuns))
            return (totalBases/Double(atBats) * 1000)
        }
    }
    var SLGLeft: Double {
        get {
            guard atBatsLeft != 0 else {
                return 0
            }
            let totalBasesLeft = Double(singlesLeft + (2 * doublesLeft) + (3 * triplesLeft) + (4 * homeRunsLeft))
            return (totalBasesLeft/Double(atBatsLeft) * 1000)
        }
    }
    var SLGRight: Double {
        get {
            guard atBatsRight != 0 else {
                return 0
            }
            let totalBasesRight = Double(singlesRight + (2 * doublesRight) + (3 * triplesRight) + (4 * homeRunsRight))
            return (totalBasesRight/Double(atBatsRight) * 1000)
        }
    }
    var OPS: Double {
        get {
            guard Double((atBats * (atBats + walks + sacrifices + hbp))) != 0 else {
                return 0
            }
            let totalBases = Double(singles + (2 * doubles) + (3 * triples) + (4 * homeRuns))

            let first = Double((atBats * (hits + walks + hbp)))
            let second = (totalBases * Double((atBats + walks + sacrifices + hbp)))

            let numerator = first + second
            let denominator = Double((atBats * (atBats + walks + sacrifices + hbp)))
            return (numerator / denominator) * 1000
        }
    }
    var OPSLeft: Double {
        get {
            guard Double((atBatsLeft * (atBatsLeft + walksLeft + sacrificesLeft + hbpLeft))) != 0 else {
                return 0
            }
            let totalBasesLeft = Double(singlesLeft + (2 * doublesLeft) + (3 * triplesLeft) + (4 * homeRunsLeft))

            let firstLeft = Double((atBatsLeft * (hitsLeft + walksLeft + hbpLeft)))
            let secondLeft = (totalBasesLeft * Double((atBatsLeft + walksLeft + sacrificesLeft + hbpLeft)))

            let numeratorLeft = firstLeft + secondLeft
            let denominatorLeft = Double((atBatsLeft * (atBatsLeft + walksLeft + sacrificesLeft + hbpLeft)))
            return (numeratorLeft / denominatorLeft) * 1000
        }
    }
    var OPSRight: Double {
        get {
            guard Double((atBatsRight * (atBatsRight + walksRight + sacrificesRight + hbpRight))) != 0 else {
                return 0
            }
            let totalBasesRight = Double(singlesRight + (2 * doublesRight) + (3 * triplesRight) + (4 * homeRunsRight))

            let firstRight = Double((atBatsRight * (hitsRight + walksRight + hbpRight)))
            let secondRight = (totalBasesRight * Double((atBatsRight + walksRight + sacrificesRight + hbpRight)))

            let numeratorRight = firstRight + secondRight
            let denominatorRight = Double((atBatsRight * (atBatsRight + walksRight + sacrificesRight + hbpRight)))
            return (numeratorRight / denominatorRight) * 1000
        }
    }
}
