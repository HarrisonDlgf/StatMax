//
//  Pitcher.swift
//  NoblesStatsMax
//
//  Created by Harrison on 4/10/23.
//

import Foundation
import CoreData

//Request these variables from the coach
@objc(Pitcher)
public class Pitcher: NSManagedObject, Identifiable {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pitcher> {
        return NSFetchRequest<Pitcher>(entityName: "Pitcher")
    }
    
    @NSManaged public var hitsAgainst: Int32
    @NSManaged public var innings: Double
    @NSManaged public var earnedRuns: Int32
    @NSManaged public var bb: Int32
    @NSManaged public var strikeouts: Int32
    @NSManaged public var pitchCount: Int32
    @NSManaged public var pitcherName: String
    @NSManaged public var atBatsPitcher: Int32
    @NSManaged public var hbpPitcher: Int32
    @NSManaged public var wPitcher: Int32
    @NSManaged public var lPitcher: Int32
    
    var ERA: Double {
        get {
            guard innings != 0 else {
                return 0
            }
            return (Double(earnedRuns) / Double(innings)) * 9
        }
        set { }
    }
    var BB9: Double {
        get {
            guard innings != 0 else {
                return 0
            }
            return ((Double(bb) * 9.0) / Double(innings)) 
        }
        set { }
    }
    var WHIP: Double {
        get {
            guard innings != 0 else {
                return 0
            }
            return ((Double(bb) + Double(hitsAgainst)) / Double(innings))
        }
        set { }
    }
    var BAA: Double {
        get {
            guard atBatsPitcher != 0 else {
                return 0
            }
            return (Double(hitsAgainst)) / (Double(atBatsPitcher) + Double(bb) + Double(hbpPitcher))
        }
        set { }
    }


}
