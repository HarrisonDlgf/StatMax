//
//  ThirdView.swift
//  NoblesStatsMax
//
//  Created by Harrison on 4/24/23.
//

import Foundation
import SwiftUI

struct EditPlayerView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Player.entity(), sortDescriptors: []) private var players: FetchedResults<Player>
    @FetchRequest(entity: Pitcher.entity(), sortDescriptors: []) private var pitchers: FetchedResults<Pitcher>
    @FocusState private var amountIsFocused: Bool
    @State private var pitcherOrBatter = 0
    @State private var leftOrRight = 0
    @State private var selectedPlayerIdx = 0
    @State private var selectedPitcherIdx = 0
    @State var name = ""
    @State var hits = 0
    @State var walks = 0
    @State var singles = 0
    @State var doubles = 0
    @State var triples = 0
    @State var homeRuns = 0
    @State var hbp = 0
    @State var sacrifices = 0
    @State var atBats = 0
    @State var runs = 0
    @State var rbis = 0
    @State var k = 0
    //NEW SEPERATION
    @State var hitsRight = 0
    @State var walksRight = 0
    @State var singlesRight = 0
    @State var doublesRight = 0
    @State var triplesRight = 0
    @State var homeRunsRight = 0
    @State var sacrificesRight = 0
    @State var atBatsRight = 0
    @State var runsRight = 0
    @State var hbpRight = 0
    @State var rbisRight = 0
    @State var kRight = 0
    //LEFT
    @State var hitsLeft = 0
    @State var walksLeft = 0
    @State var singlesLeft = 0
    @State var doublesLeft = 0
    @State var triplesLeft = 0
    @State var homeRunsLeft = 0
    @State var sacrificesLeft = 0
    @State var atBatsLeft = 0
    @State var runsLeft = 0
    @State var hbpLeft = 0
    @State var rbisLeft = 0
    @State var kLeft = 0
    // PITCHER VARS
    @State var pitcherName = ""
    @State var hitsAgainst = 0
    @State var inningsJockyJockForm = 0.0
    @State var earnedRuns = 0
    @State var bb = 0
    @State var strikeouts = 0
    @State var pitchCount = 0
    @State var atBatsPitcher = 0
    @State var hbpPitcher = 0
    @State var wPitcher = 0
    @State var lPitcher = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("", selection: $pitcherOrBatter){
                        Text("Batter").tag(0)
                        Text("Pitcher").tag(1)
                    }
                    .pickerStyle(.segmented)
                }
                if pitcherOrBatter == 0 {
                    if players.isEmpty {
                        Section {
                            Text("Please Enter A Batter To Modify Statistics")
                        }
                    } else {
                        Section {
                            Picker("Pick A Batter", selection: $selectedPlayerIdx) {
                                ForEach(players.indices, id: \.self) { playerIdx in
                                    Text(players[playerIdx].name)
                                        .tag(playerIdx)
                                }
                            }
                            Picker("", selection: $leftOrRight){
                                Text("Left").tag(0)
                                Text("Right").tag(1)
                            }
                            .pickerStyle(.segmented)
                        }
                        
                        Section {
                            let selectedPlayer = players[selectedPlayerIdx]
                            if(selectedPlayer.name.hasSuffix("s")){
                                Text("Viewing \(selectedPlayer.name)' Current Numbers:")
                            } else {
                                Text("Viewing \(selectedPlayer.name)'s Current Numbers:")
                            }
                            if leftOrRight == 0 {
                                Group {
                                    HStack{
                                        Text("Hits: \(String(selectedPlayer.hitsLeft))")
                                        Stepper("", value: $hitsLeft)
                                        Text("\(hitsLeft < 0 ? "" : "+")\(hitsLeft)")
                                            .frame(width: 50, alignment: .trailing)
                                            .foregroundColor(hitsLeft == 0 ? .white : hitsLeft > 0 ? .green : .red)
                                    }
                                    HStack{
                                        Text("Walks: \(selectedPlayer.walksLeft)")
                                        Stepper("", value: $walksLeft)
                                        Text("\(walksLeft < 0 ? "" : "+")\(walksLeft)")
                                            .frame(width: 50, alignment: .trailing)
                                            .foregroundColor(walksLeft == 0 ? .white : walksLeft > 0 ? .green : .red)
                                    }
                                    HStack{
                                        Text("HBP: \(selectedPlayer.hbpLeft)")
                                        Stepper("", value: $hbpLeft)
                                        Text("\(hbpLeft < 0 ? "" : "+")\(hbpLeft)")
                                            .frame(width: 50, alignment: .trailing)
                                            .foregroundColor(hbpLeft == 0 ? .white : hbpLeft > 0 ? .green : .red)
                                    }
                                    HStack{
                                        Text("Sacrifices: \(selectedPlayer.sacrificesLeft) ")
                                        Stepper("", value: $sacrificesLeft)
                                        Text("\(sacrificesLeft < 0 ? "" : "+")\(sacrificesLeft)")
                                            .frame(width: 50, alignment: .trailing)
                                            .foregroundColor(sacrificesLeft == 0 ? .white : sacrificesLeft > 0 ? .green : .red)
                                    }
                                    HStack{
                                        Text("At Bats: \(selectedPlayer.atBatsLeft) ")
                                        Stepper("", value: $atBatsLeft)
                                        Text("\(atBatsLeft < 0 ? "" : "+")\(atBatsLeft)")
                                            .frame(width: 50, alignment: .trailing)
                                            .foregroundColor(atBatsLeft == 0 ? .white : atBatsLeft > 0 ? .green : .red)
                                    }
                                    HStack{
                                        Text("Strikeouts: \(selectedPlayer.kLeft) ")
                                        Stepper("", value: $kLeft)
                                        Text("\(kLeft < 0 ? "" : "+")\(kLeft)")
                                            .frame(width: 50, alignment: .trailing)
                                            .foregroundColor(kLeft == 0 ? .white : kLeft > 0 ? .green : .red)
                                    }
                                }
                                HStack{
                                    Text("Singles: \(String(selectedPlayer.singlesLeft)) ")
                                    Stepper("", value: $singlesLeft)
                                    Text("\(singlesLeft < 0 ? "" : "+")\(singlesLeft)")
                                        .frame(width: 50, alignment: .trailing)
                                        .foregroundColor(singlesLeft == 0 ? .white : singlesLeft > 0 ? .green : .red)
                                }
                                HStack{
                                    Text("Doubles: \(selectedPlayer.doublesLeft) ")
                                    Stepper("", value: $doublesLeft)
                                    Text("\(doublesLeft < 0 ? "" : "+")\(doublesLeft)")
                                        .frame(width: 50, alignment: .trailing)
                                        .foregroundColor(doublesLeft == 0 ? .white : doublesLeft > 0 ? .green : .red)
                                }
                                HStack{
                                    Text("Triples: \(selectedPlayer.triplesLeft) ")
                                    Stepper("", value: $triplesLeft)
                                    Text("\(triplesLeft < 0 ? "" : "+")\(triplesLeft)")
                                        .frame(width: 50, alignment: .trailing)
                                        .foregroundColor(triplesLeft == 0 ? .white : triplesLeft > 0 ? .green : .red)
                                }
                                HStack{
                                    Text("Home Runs: \(selectedPlayer.homeRunsLeft) ")
                                    Stepper("", value: $homeRunsLeft)
                                    Text("\(homeRunsLeft < 0 ? "" : "+")\(homeRunsLeft)")
                                        .frame(width: 50, alignment: .trailing)
                                        .foregroundColor(homeRunsLeft == 0 ? .white : homeRunsLeft > 0 ? .green : .red)
                                }
                                HStack{
                                    Text("Runs: \(selectedPlayer.runsLeft)")
                                    Stepper("", value: $runsLeft)
                                    Text("\(runsLeft < 0 ? "" : "+")\(runsLeft)")
                                        .frame(width: 50, alignment: .trailing)
                                        .foregroundColor(runsLeft == 0 ? .white : runsLeft > 0 ? .green : .red)
                                }
                                HStack{
                                    Text("RBIs: \(selectedPlayer.rbisLeft)")
                                    Stepper("", value: $rbisLeft)
                                    Text("\(rbisLeft < 0 ? "" : "+")\(rbisLeft)")
                                        .frame(width: 50, alignment: .trailing)
                                        .foregroundColor(rbisLeft == 0 ? .white : rbisLeft > 0 ? .green : .red)
                                }
                            } else if leftOrRight == 1 {
                                Group {
                                    HStack{
                                        Text("Hits: \(String(selectedPlayer.hitsRight))")
                                        Stepper("", value: $hitsRight)
                                        Text("\(hitsRight < 0 ? "" : "+")\(hitsRight)")
                                            .frame(width: 50, alignment: .trailing)
                                            .foregroundColor(hitsRight == 0 ? .white : hitsRight > 0 ? .green : .red)
                                    }
                                    HStack{
                                        Text("Walks: \(selectedPlayer.walksRight)")
                                        Stepper("", value: $walksRight)
                                        Text("\(walksRight < 0 ? "" : "+")\(walksRight)")
                                            .frame(width: 50, alignment: .trailing)
                                            .foregroundColor(walksRight == 0 ? .white : walksRight > 0 ? .green : .red)
                                    }
                                    HStack{
                                        Text("HBP: \(selectedPlayer.hbpRight)")
                                        Stepper("", value: $hbpRight)
                                        Text("\(hbpRight < 0 ? "" : "+")\(hbpRight)")
                                            .frame(width: 50, alignment: .trailing)
                                            .foregroundColor(hbpRight == 0 ? .white : hbpRight > 0 ? .green : .red)
                                    }
                                    HStack{
                                        Text("Sacrifices: \(selectedPlayer.sacrificesRight) ")
                                        Stepper("", value: $sacrificesRight)
                                        Text("\(sacrificesRight < 0 ? "" : "+")\(sacrificesRight)")
                                            .frame(width: 50, alignment: .trailing)
                                            .foregroundColor(sacrificesRight == 0 ? .white : sacrificesRight > 0 ? .green : .red)
                                    }
                                    HStack{
                                        Text("At Bats: \(selectedPlayer.atBatsRight) ")
                                        Stepper("", value: $atBatsRight)
                                        Text("\(atBatsRight < 0 ? "" : "+")\(atBatsRight)")
                                            .frame(width: 50, alignment: .trailing)
                                            .foregroundColor(atBatsRight == 0 ? .white : atBatsRight > 0 ? .green : .red)
                                    }
                                }
                                HStack{
                                    Text("Strikeouts: \(selectedPlayer.kRight) ")
                                    Stepper("", value: $kRight)
                                    Text("\(kRight < 0 ? "" : "+")\(kRight)")
                                        .frame(width: 50, alignment: .trailing)
                                        .foregroundColor(kRight == 0 ? .white : kRight > 0 ? .green : .red)
                                }
                                Group {
                                    HStack{
                                        Text("Singles: \(String(selectedPlayer.singlesRight)) ")
                                        Stepper("", value: $singlesRight)
                                        Text("\(singlesRight < 0 ? "" : "+")\(singlesRight)")
                                            .frame(width: 50, alignment: .trailing)
                                            .foregroundColor(singlesRight == 0 ? .white : singlesRight > 0 ? .green : .red)
                                    }
                                    HStack{
                                        Text("Doubles: \(selectedPlayer.doublesRight) ")
                                        Stepper("", value: $doublesRight)
                                        Text("\(doublesRight < 0 ? "" : "+")\(doublesRight)")
                                            .frame(width: 50, alignment: .trailing)
                                            .foregroundColor(doublesRight == 0 ? .white : doublesRight > 0 ? .green : .red)
                                    }
                                    HStack{
                                        Text("Triples: \(selectedPlayer.triplesRight) ")
                                        Stepper("", value: $triplesRight)
                                        Text("\(triplesRight < 0 ? "" : "+")\(triplesRight)")
                                            .frame(width: 50, alignment: .trailing)
                                            .foregroundColor(triplesRight == 0 ? .white : triplesRight > 0 ? .green : .red)
                                    }
                                    HStack{
                                        Text("Home Runs: \(selectedPlayer.homeRunsRight) ")
                                        Stepper("", value: $homeRunsRight)
                                        Text("\(homeRunsRight < 0 ? "" : "+")\(homeRunsRight)")
                                            .frame(width: 50, alignment: .trailing)
                                            .foregroundColor(homeRunsRight == 0 ? .white : homeRunsRight > 0 ? .green : .red)
                                    }
                                    HStack{
                                        Text("Runs: \(selectedPlayer.runsRight)")
                                        Stepper("", value: $runsRight)
                                        Text("\(runsRight < 0 ? "" : "+")\(runsRight)")
                                            .frame(width: 50, alignment: .trailing)
                                            .foregroundColor(runsRight == 0 ? .white : runsRight > 0 ? .green : .red)
                                    }
                                    HStack{
                                        Text("RBIs: \(selectedPlayer.rbisRight)")
                                        Stepper("", value: $rbisRight)
                                        Text("\(rbisRight < 0 ? "" : "+")\(rbisRight)")
                                            .frame(width: 50, alignment: .trailing)
                                            .foregroundColor(rbisRight == 0 ? .white : rbisRight > 0 ? .green : .red)
                                    }
                                }
                            }
                        }
                        Section{
                            Button(action:{
                                modifyPlayer()
                            }) {
                                Text("Modify Person")
                            }
                            
                            Button(action:{
                                deletePlayer()
                            }) {
                                Text("Delete Person")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                } else {
                    if pitchers.isEmpty {
                        Section {
                            Text("Please Enter A Pitcher To Modify Statistics")
                        }
                    } else {
                        Section {
                            Picker("Pick A Pitcher", selection: $selectedPitcherIdx) {
                                ForEach(pitchers.indices, id: \.self) { pitcherIdx in
                                    Text(pitchers[pitcherIdx].pitcherName)
                                        .tag(pitcherIdx)
                                }
                            }
                        }
                        Section {
                            let selectedPitcher = pitchers[selectedPitcherIdx]
                            if(selectedPitcher.pitcherName.hasSuffix("s")){
                                Text("Viewing \(selectedPitcher.pitcherName)' Current Numbers:")
                            } else {
                                Text("Viewing \(selectedPitcher.pitcherName)'s Current Numbers:")
                            }
                            HStack{
                                Text("Wins: \(String(selectedPitcher.wPitcher))")
                                Stepper("", value: $wPitcher)
                                Text("\(wPitcher < 0 ? "" : "+")\(wPitcher)")
                                    .frame(alignment: .trailing)
                                    .foregroundColor(wPitcher == 0 ? .white : wPitcher > 0 ? .green : .red)
                            }
                            HStack{
                                Text("Losses: \(String(selectedPitcher.lPitcher))")
                                Stepper("", value: $lPitcher)
                                Text("\(lPitcher < 0 ? "" : "+")\(lPitcher)")
                                    .frame(alignment: .trailing)
                                    .foregroundColor(lPitcher == 0 ? .white : lPitcher > 0 ? .green : .red)
                            }
                            Group {
                                HStack{
                                    Text("Hits Against: \(String(selectedPitcher.hitsAgainst))")
                                    Stepper("", value: $hitsAgainst)
                                    Text("\(hitsAgainst < 0 ? "" : "+")\(hitsAgainst)")
                                        .frame(width: 50, alignment: .trailing)
                                        .foregroundColor(hitsAgainst == 0 ? .white : hitsAgainst > 0 ? .green : .red)
                                }
                                HStack{
                                    Text("Earned Runs: \(String(selectedPitcher.earnedRuns))")
                                    Stepper("", value: $earnedRuns)
                                    Text("\(earnedRuns < 0 ? "" : "+")\(earnedRuns)")
                                        .frame(width: 50, alignment: .trailing)
                                        .foregroundColor(earnedRuns == 0 ? .white : earnedRuns > 0 ? .green : .red)
                                }
                                HStack{
                                    Text("Base on Balls: \(String(selectedPitcher.bb))")
                                    Stepper("", value: $bb)
                                    Text("\(bb < 0 ? "" : "+")\(bb)")
                                        .frame(width: 50, alignment: .trailing)
                                        .foregroundColor(bb == 0 ? .white : bb > 0 ? .green : .red)
                                }
                                HStack{
                                    Text("Strikeouts: \(String(selectedPitcher.strikeouts))")
                                    Stepper("", value: $strikeouts)
                                    Text("\(strikeouts < 0 ? "" : "+")\(strikeouts)")
                                        .frame(width: 50, alignment: .trailing)
                                        .foregroundColor(strikeouts == 0 ? .white : strikeouts > 0 ? .green : .red)
                                }
                                HStack{
                                    Text("Pitch Count: \(String(selectedPitcher.pitchCount))")
                                    Stepper("", value: $pitchCount)
                                    Text("\(pitchCount < 0 ? "" : "+")\(pitchCount)")
                                        .frame(width: 50, alignment: .trailing)
                                        .foregroundColor(pitchCount == 0 ? .white : pitchCount > 0 ? .green : .red)
                                }
                            }
                            HStack{
                                Text("At Bats Against: \(String(selectedPitcher.atBatsPitcher))")
                                Stepper("", value: $atBatsPitcher)
                                Text("\(atBatsPitcher < 0 ? "" : "+")\(atBatsPitcher)")
                                    .frame(width: 50, alignment: .trailing)
                                    .foregroundColor(atBatsPitcher == 0 ? .white : atBatsPitcher > 0 ? .green : .red)
                            }
                            HStack{
                                Text("Hit By Pitches: \(String(selectedPitcher.hbpPitcher))")
                                Stepper("", value: $hbpPitcher)
                                Text("\(hbpPitcher < 0 ? "" : "+")\(hbpPitcher)")
                                    .frame(alignment: .trailing)
                                    .foregroundColor(hbpPitcher == 0 ? .white : hbpPitcher > 0 ? .green : .red)
                            }
                            HStack{
                                Text("Innings: \(String(selectedPitcher.innings))")
                                TextField("NEW INNINGS VALUE", value: $inningsJockyJockForm, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.decimalPad)
                                    .focused($amountIsFocused)
                            }
                        }
                        Section{
                            Button(action:{
                                modifyPitcher()
                            }) {
                                Text("Modify Pitcher")
                            }
                            
                            Button(action:{
                                deletePitcher()
                            }) {
                                Text("Delete Pitcher")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Edit Player")
        }
    }
    
    private func deletePlayer(){
        let object = players[selectedPlayerIdx]
        selectedPlayerIdx = 0
        viewContext.delete(object)
        do {
            try viewContext.save()
        }
        catch {
            print("why use many word code when little code do not worky")
        }
    }
        
    private func deletePitcher(){
        let objectPitch = pitchers[selectedPitcherIdx]
        selectedPitcherIdx = 0
        viewContext.delete(objectPitch)
        do {
            try viewContext.save()
        }
        catch {
            print("why use many word code when little code do not worky")
        }
    }
        
    private func modifyPlayer(){
        let modifiedPlayer = players[selectedPlayerIdx]
        modifiedPlayer.hits += Int32(hitsLeft) + Int32(hitsRight)
        modifiedPlayer.walks += Int32(walksLeft) + Int32(walksRight)
        modifiedPlayer.singles += Int32(singlesLeft) + Int32(singlesRight)
        modifiedPlayer.doubles += Int32(doublesLeft) + Int32(doublesRight)
        modifiedPlayer.triples += Int32(triplesLeft) + Int32(triplesRight)
        modifiedPlayer.homeRuns += Int32(homeRunsLeft) + Int32(homeRunsRight)
        modifiedPlayer.hbp += Int32(hbpLeft) + Int32(hbpRight)
        modifiedPlayer.sacrifices += Int32(sacrificesLeft) + Int32(sacrificesRight)
        modifiedPlayer.atBats += Int32(atBatsLeft) + Int32(atBatsRight)
        modifiedPlayer.runs += Int32(runsLeft) + Int32(runsRight)
        modifiedPlayer.rbis += Int32(rbisLeft) + Int32(rbisRight)
        modifiedPlayer.k += Int32(kLeft) + Int32(kRight)
        
        //LEFT
        modifiedPlayer.hitsLeft += Int32(hitsLeft)
        modifiedPlayer.walksLeft += Int32(walksLeft)
        modifiedPlayer.singlesLeft += Int32(singlesLeft)
        modifiedPlayer.doublesLeft += Int32(doublesLeft)
        modifiedPlayer.triplesLeft += Int32(triplesLeft)
        modifiedPlayer.homeRunsLeft += Int32(homeRunsLeft)
        modifiedPlayer.hbpLeft += Int32(hbpLeft)
        modifiedPlayer.sacrificesLeft += Int32(sacrificesLeft)
        modifiedPlayer.atBatsLeft += Int32(atBatsLeft)
        modifiedPlayer.runsLeft += Int32(runsLeft)
        modifiedPlayer.rbisLeft += Int32(rbisLeft)
        modifiedPlayer.kLeft += Int32(kLeft)
        
        //RIGHT
        modifiedPlayer.hitsRight += Int32(hitsRight)
        modifiedPlayer.walksRight += Int32(walksRight)
        modifiedPlayer.singlesRight += Int32(singlesRight)
        modifiedPlayer.doublesRight += Int32(doublesRight)
        modifiedPlayer.triplesRight += Int32(triplesRight)
        modifiedPlayer.homeRunsRight += Int32(homeRunsRight)
        modifiedPlayer.hbpRight += Int32(hbpRight)
        modifiedPlayer.sacrificesRight += Int32(sacrificesRight)
        modifiedPlayer.atBatsRight += Int32(atBatsRight)
        modifiedPlayer.runsRight += Int32(runsRight)
        modifiedPlayer.rbisRight += Int32(rbisRight)
        modifiedPlayer.kRight += Int32(kRight)
        
        do {
            try viewContext.save()
        } catch {
            print("Error with modifyPlayer")
        }
        
        hits = 0
        walks = 0
        singles = 0
        doubles = 0
        triples = 0
        homeRuns = 0
        hbp = 0
        sacrifices = 0
        atBats = 0
        runs = 0
        rbis = 0
        k = 0
        //left reset
        hitsLeft = 0
        walksLeft = 0
        singlesLeft = 0
        doublesLeft = 0
        triplesLeft = 0
        homeRunsLeft = 0
        hbpLeft = 0
        sacrificesLeft = 0
        atBatsLeft = 0
        runsLeft = 0
        rbisLeft = 0
        kLeft = 0
        //right reset
        hitsRight = 0
        walksRight = 0
        singlesRight = 0
        doublesRight = 0
        triplesRight = 0
        homeRunsRight = 0
        hbpRight = 0
        sacrificesRight = 0
        atBatsRight = 0
        runsRight = 0
        rbisRight = 0
        kRight = 0 
        
    }
    private func modifyPitcher(){
        let inningsMathyMathForm: Double = Double(Int(inningsJockyJockForm * 10) % 10) / 3 + Double(Int(inningsJockyJockForm))
        let modifiedPitcher = pitchers[selectedPitcherIdx]
        modifiedPitcher.hitsAgainst += Int32(hitsAgainst)
        modifiedPitcher.innings += Double(inningsMathyMathForm)
        modifiedPitcher.earnedRuns += Int32(earnedRuns)
        modifiedPitcher.bb += Int32(bb)
        modifiedPitcher.strikeouts += Int32(strikeouts)
        modifiedPitcher.pitchCount += Int32(pitchCount)
        modifiedPitcher.atBatsPitcher += Int32(atBatsPitcher)
        modifiedPitcher.hbpPitcher += Int32(hbpPitcher)
        modifiedPitcher.wPitcher += Int32(wPitcher)
        modifiedPitcher.lPitcher += Int32(lPitcher)
        
        do {
            try viewContext.save()
        } catch {
            print("Error with modifyPitcher")
        }
        
        hitsAgainst = 0
        inningsJockyJockForm = 0.0
        earnedRuns = 0
        bb = 0
        strikeouts = 0
        pitchCount = 0
        atBatsPitcher = 0
        hbpPitcher = 0
        wPitcher = 0
        lPitcher = 0 
    }
}
