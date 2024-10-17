//
//  LeaderboardView.swift
//  NoblesStatsMax
//
//  Created by Harrison on 5/24/23.
//

import SwiftUI
struct LeaderboardView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Player.entity(), sortDescriptors: []) private var players: FetchedResults<Player>
    @FetchRequest(entity: Pitcher.entity(), sortDescriptors: []) private var pitchers: FetchedResults<Pitcher>
    @State private var pitcherOrBatter = 0
    @State private var leftOrRight = 0
    @State private var selectedPlayerIdx = 0
    @State private var selectedPitcherIdx = 0
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("", selection: $pitcherOrBatter){
                        Text("Batter").tag(0)
                        Text("Pitcher").tag(1)
                    }
                    .pickerStyle(.segmented)
                    if pitcherOrBatter == 0 {
                        Picker("", selection: $leftOrRight){
                            Text("Left").tag(0)
                            Text("General").tag(1)
                            Text("Right").tag(2)
                        }
                        .pickerStyle(.segmented)
                        
                        let filteredPlayers = filteredPlayersAverage()
                        ForEach(filteredPlayers, id: \.name) { player in
                            HStack {
                                Text(player.name)
                                
                                Spacer()
                                
                                Text(playerStat(player))
                            }
                        }
                        
                    } else {
                        //PITCHER LEADERBOARD
                    }
                }
            }
            .navigationTitle("Leaderboard")
        }
    }
    
    private func filteredPlayersAverage() -> [Player] {
        if leftOrRight == 0 {
            return players.sorted(by: { $0.averageLeft > $1.averageLeft })
        } else if leftOrRight == 1 {
            //GENERAL BATTER STATS
            return players.sorted(by: { $0.average > $1.average })
        } else {
            //RIGHTY BATTER STATS
            return players.sorted(by: { $0.averageRight > $1.averageRight })
        }
    }
    
    private func playerStat(_ player: Player) -> String {
        var average: Double!
        if leftOrRight == 0 {
            average = player.averageLeft
        } else if leftOrRight == 1 {
            //GENERAL BATTER STATS
            average = player.average
        } else {
            //RIGHTY BATTER STATS
            average = player.averageRight
        }
        return ".\(String(format: "%.0f", average))"
    }
}
