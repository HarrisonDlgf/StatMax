//
//  ViewPlayerView.swift
//  NoblesStatsMax
//
//  Created by Harrison on 4/24/23.
//

import Foundation
import SwiftUI

struct ViewPlayerView: View {
    @FetchRequest(entity: Player.entity(), sortDescriptors: []) private var players: FetchedResults<Player>
    @FetchRequest(entity: Pitcher.entity(), sortDescriptors: []) private var pitchers: FetchedResults<Pitcher>
    @State private var selectedPlayerIdx = 0
    @State private var selectedPitcherIdx = 0
    @State private var pitcherOrBatter = 0
    @State private var leftOrRight = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    Picker("", selection: $pitcherOrBatter){
                        Text("Batter").tag(0)
                        Text("Pitcher").tag(1)
                    }
                    .pickerStyle(.segmented)
                }
                if pitcherOrBatter == 0 {
                    Section {
                        if players.isEmpty {
                            Text("Please Enter A Player To View Statistics")
                        } else {
                            Section {
                                Picker("Pick A Player", selection: $selectedPlayerIdx) {
                                    ForEach(players.indices, id: \.self) { playerIdx in
                                        Text(players[playerIdx].name)
                                            .tag(playerIdx)
                                    }
                                }
                                Picker("", selection: $leftOrRight){
                                    Text("Left").tag(0)
                                    Text("General").tag(1)
                                    Text("Right").tag(2)
                                }
                                .pickerStyle(.segmented)
                            }
                            if leftOrRight == 0 {
                                let selectedPlayerLeft = players[selectedPlayerIdx]
                                if selectedPlayerLeft.name.hasSuffix("s") {
                                    Text("Viewing \(selectedPlayerLeft.name)' Statistics:")
                                } else {
                                    Text("Viewing \(selectedPlayerLeft.name)'s Statistics:")
                                }
                                Text("Batting Average: .\(String(format: "%.0f", selectedPlayerLeft.averageLeft))")
                                Text("On Base Percentage: .\(String(format: "%.0f", selectedPlayerLeft.OBPLeft))")
                                Text("Slugging Percentage: .\(String(format: "%.0f", selectedPlayerLeft.SLGLeft)) ")
                                Text("OPS: .\(String(format: "%.0f", selectedPlayerLeft.OPSLeft)) ")
                                Text("K%: \(String(format: "%.1f",selectedPlayerLeft.kRateLeft))")
                                Text("BB%: \(String(format: "%.1f", selectedPlayerLeft.bbRateLeft))")
                                Text("RBIs: \(selectedPlayerLeft.rbisLeft)")
                                Text("Plate Appearances: \(selectedPlayerLeft.plateAppearancesLeft)")
                            } else if leftOrRight == 1 {
                                let selectedPlayer = players[selectedPlayerIdx]
                                if selectedPlayer.name.hasSuffix("s") {
                                    Text("Viewing \(selectedPlayer.name)' Statistics:")
                                } else {
                                    Text("Viewing \(selectedPlayer.name)'s Statistics:")
                                }
                                Text("Batting Average: .\(String(format: "%.0f", selectedPlayer.average))")
                                Text("On Base Percentage: .\(String(format: "%.0f", selectedPlayer.OBP))")
                                Text("Slugging Percentage: .\(String(format: "%.0f", selectedPlayer.SLG)) ")
                                Text("OPS: .\(String(format: "%.0f", selectedPlayer.OPS)) ")
                                Text("K%: \(String(format: "%.1f",selectedPlayer.kRate))")
                                Text("BB%: \(String(format: "%.1f",selectedPlayer.bbRate))")
                                Text("RBIs: \(selectedPlayer.rbis)")
                                Text("Plate Appearances: \(selectedPlayer.plateAppearances)")
                            } else {
                                let selectedPlayerRight = players[selectedPlayerIdx]
                                if selectedPlayerRight.name.hasSuffix("s") {
                                    Text("Viewing \(selectedPlayerRight.name)' Statistics:")
                                } else {
                                    Text("Viewing \(selectedPlayerRight.name)'s Statistics:")
                                }
                                Text("Batting Average: .\(String(format: "%.0f", selectedPlayerRight.averageRight))")
                                Text("On Base Percentage: .\(String(format: "%.0f", selectedPlayerRight.OBPRight))")
                                Text("Slugging Percentage: .\(String(format: "%.0f", selectedPlayerRight.SLGRight)) ")
                                Text("OPS: .\(String(format: "%.0f", selectedPlayerRight.OPSRight)) ")
                                Text("K%: \(String(format: "%.1f",selectedPlayerRight.kRateRight))")
                                Text("BB%: \(String(format: "%.1f",selectedPlayerRight.bbRateRight))")
                                Text("RBIs: \(selectedPlayerRight.rbisRight)")
                                Text("Plate Appearances: \(selectedPlayerRight.plateAppearancesRight)")
                            }
                        }
                    }
                } else {
                    Section {
                        if pitchers.isEmpty {
                            Text("Please Enter A Pitcher To View Statistics")
                        } else {
                            Picker("Pick A Pitcher", selection: $selectedPitcherIdx) {
                                ForEach(pitchers.indices, id: \.self) { pitcherIdx in
                                    Text(pitchers[pitcherIdx].pitcherName)
                                        .tag(pitcherIdx)
                                }
                            }
                            let selectedPitcher = pitchers[selectedPitcherIdx]
                            if selectedPitcher.pitcherName.hasSuffix("s") {
                                Text("Viewing \(selectedPitcher.pitcherName)' Statistics:")
                            } else {
                                Text("Viewing \(selectedPitcher.pitcherName)'s Statistics:")
                            }
                            Text("Record: \(selectedPitcher.wPitcher)-\(selectedPitcher.lPitcher)")
                            Text("ERA: \(String(format: "%.2f", selectedPitcher.ERA))")
                            Text("BB/9: \(String(format: "%.2f",selectedPitcher.BB9))")
                            Text("WHIP: \(String(format: "%.3f",selectedPitcher.WHIP))")
                            Text("BAA: \(String(format: "%.3f",selectedPitcher.BAA))")
                        }
                    }
                }
            }
            .navigationTitle("Stat Max")
        }
    }
}
