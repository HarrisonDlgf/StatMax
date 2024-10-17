//
//  AddPlayerView.swift
//  NoblesStatsMax
//
//  Created by Harrison on 5/3/23.
//

import SwiftUI

struct AddPlayerView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FocusState private var amountIsFocused: Bool
    //ALL BATTER STATS
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
    @State var rbi = 0
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
    @State var rbiRight = 0
    @State var kRight = 0
    //Left
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
    @State var rbiLeft = 0
    @State var kLeft = 0
    //ALL PITCHER STATS
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
    //OTHER VARIABLES
    @State private var pitchOrBat = 0
    @State private var leftOrRight = 0
    
    var body: some View {
        NavigationView{
            Form {
                Section{
                    Picker("", selection: $pitchOrBat){
                        Text("Batter").tag(0)
                        Text("Pitcher").tag(1)
                    }
                    .pickerStyle(.segmented)
                }
                if pitchOrBat == 0 {
                    Section{
                        TextField("Enter Name", text: $name)
                            .keyboardType(.default)
                            .focused($amountIsFocused)
                        Picker("", selection: $leftOrRight){
                            Text("Left").tag(0)
                            Text("Right").tag(1)
                        }
                        .pickerStyle(.segmented)
                    } header: {
                        Text("NAME AND HANDEDNESS OF MATCHUP")
                    }
                    if leftOrRight == 0 {
                        Section{
                            HStack{
                                Text("Hits:")
                                TextField("", value: $hitsLeft, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                            HStack{
                                Text("Walks:")
                                TextField("", value: $walksLeft, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                            HStack{
                                Text("At Bats:")
                                TextField("", value: $atBatsLeft, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                            HStack{
                                Text("HBP:")
                                TextField("", value: $hbpLeft, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                            HStack{
                                Text("Sacrifices:")
                                TextField("", value: $sacrificesLeft, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                            HStack{
                                Text("Strikeouts:")
                                TextField("", value: $kLeft, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                        } header: {
                            Text("Broad V. Lefty ")
                        }
                        Section{
                            HStack{
                                Text("Singles:")
                                TextField("", value: $singlesLeft, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                            HStack{
                                Text("Doubles:")
                                TextField("", value: $doublesLeft, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                            HStack{
                                Text("Triples:")
                                TextField("", value: $triplesLeft, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                            HStack{
                                Text("Home Runs:")
                                TextField("", value: $homeRunsLeft, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                            HStack{
                                Text("Runs:")
                                TextField("", value: $runsLeft, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                            HStack{
                                Text("RBIs:")
                                TextField("", value: $rbiLeft, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                        } header: {
                            Text("Focused V. Lefty ")
                        }
                    } else {
                        Section {
                            HStack{
                                Text("Hits:")
                                TextField("", value: $hitsRight, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                            HStack{
                                Text("Walks:")
                                TextField("", value: $walksRight, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                            HStack{
                                Text("At Bats:")
                                TextField("", value: $atBatsRight, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                            HStack{
                                Text("HBP:")
                                TextField("", value: $hbpRight, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                            HStack{
                                Text("Sacrifices:")
                                TextField("", value: $sacrificesRight, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                            HStack{
                                Text("Strikeouts:")
                                TextField("", value: $kRight, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                    } header: {
                        Text("Broad V. Righty ")
                    }
                        Section {
                            HStack{
                                Text("Singles:")
                                TextField("", value: $singlesRight, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                            HStack{
                                Text("Doubles:")
                                TextField("", value: $doublesRight, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                            HStack{
                                Text("Triples:")
                                TextField("", value: $triplesRight, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                            HStack{
                                Text("Home Runs:")
                                TextField("", value: $homeRunsRight, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                            HStack{
                                Text("Runs:")
                                TextField("", value: $runsRight, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                            HStack{
                                Text("RBIs:")
                                TextField("", value: $rbiRight, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                        } header: {
                            Text("Focused V. Righty ")
                        }
                    }
                    Section{
                        Button(action:{
                            addNewPlayer()
                        }) {
                            Text("New Player")
                        }
                    }

                } else {
                    Section{
                        Group {
                            TextField("Enter Name", text: $pitcherName)
                                .keyboardType(.default)
                                .focused($amountIsFocused)
                            
                            HStack{
                                Text("Total Hits Against:")
                                TextField("", value: $hitsAgainst, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                            HStack{
                                Text("Total Innings:")
                                TextField("", value: $inningsJockyJockForm, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.decimalPad)
                                    .focused($amountIsFocused)
                            }
                            HStack{
                                Text("Total Earned Runs:")
                                TextField("", value: $earnedRuns, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                            HStack{
                                Text("Walks:")
                                TextField("", value: $bb, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                            HStack{
                                Text("Strikeouts:")
                                TextField("", value: $strikeouts, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                            HStack{
                                Text("Pitch Count:")
                                TextField("", value: $pitchCount, formatter: Formatter.playerDataFormat)
                                    .keyboardType(.numberPad)
                                    .focused($amountIsFocused)
                            }
                        }
                        HStack{
                            Text("At Bats Against:")
                            TextField("", value: $atBatsPitcher, formatter: Formatter.playerDataFormat)
                                .keyboardType(.numberPad)
                                .focused($amountIsFocused)
                        }
                        HStack{
                            Text("HBP:")
                            TextField("", value: $hbpPitcher, formatter: Formatter.playerDataFormat)
                                .keyboardType(.numberPad)
                                .focused($amountIsFocused)
                        }
                        HStack{
                            Text("Wins:")
                            TextField("", value: $wPitcher, formatter: Formatter.playerDataFormat)
                                .keyboardType(.numberPad)
                                .focused($amountIsFocused)
                        }
                        HStack{
                            Text("Losses:")
                            TextField("", value: $lPitcher, formatter: Formatter.playerDataFormat)
                                .keyboardType(.numberPad)
                                .focused($amountIsFocused)
                        }
                    }
                    Section{
                        Button(action:{
                            addNewPitcher()
                        }) {
                            Text("New Pitcher")
                        }
                    }
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard){
                            Spacer()
                            Button("Done"){
                                amountIsFocused = false
                            }
                        }
                    }
                }
            }
            .navigationTitle("New Player")
        }
    }
    
    private func addNewPlayer() {
        let newPlayer = Player(context: viewContext)
        //BOTH
        newPlayer.name = name
        newPlayer.hits = Int32(hitsLeft) + Int32(hitsRight)
        newPlayer.walks = Int32(walksLeft) + Int32(walksRight)
        newPlayer.singles = Int32(singlesLeft) + Int32(singlesRight)
        newPlayer.doubles = Int32(doublesLeft) + Int32(doublesRight)
        newPlayer.triples = Int32(triplesLeft) + Int32(triplesRight)
        newPlayer.homeRuns = Int32(homeRunsLeft) + Int32(homeRunsRight)
        newPlayer.hbp = Int32(hbpLeft) + Int32(hbpRight)
        newPlayer.sacrifices = Int32(sacrificesLeft) + Int32(sacrificesRight)
        newPlayer.atBats = Int32(atBatsLeft) + Int32(atBatsRight)
        newPlayer.runs = Int32(runsLeft) + Int32(runsRight)
        newPlayer.rbis = Int32(rbiLeft) + Int32(rbiRight)
        newPlayer.k = Int32(kLeft) + Int32(kRight)
        //LEFT
        newPlayer.hitsLeft = Int32(hitsLeft)
        newPlayer.walksLeft = Int32(walksLeft)
        newPlayer.singlesLeft = Int32(singlesLeft)
        newPlayer.doublesLeft = Int32(doublesLeft)
        newPlayer.triplesLeft = Int32(triplesLeft)
        newPlayer.homeRunsLeft = Int32(homeRunsLeft)
        newPlayer.hbpLeft = Int32(hbpLeft)
        newPlayer.sacrificesLeft = Int32(sacrificesLeft)
        newPlayer.atBatsLeft = Int32(atBatsLeft)
        newPlayer.runsLeft = Int32(runsLeft)
        newPlayer.rbisLeft = Int32(rbiLeft)
        newPlayer.kLeft = Int32(kLeft)
        //RIGHT
        newPlayer.hitsRight = Int32(hitsRight)
        newPlayer.walksRight = Int32(walksRight)
        newPlayer.singlesRight = Int32(singlesRight)
        newPlayer.doublesRight = Int32(doublesRight)
        newPlayer.triplesRight = Int32(triplesRight)
        newPlayer.homeRunsRight = Int32(homeRunsRight)
        newPlayer.hbpRight = Int32(hbpRight)
        newPlayer.sacrificesRight = Int32(sacrificesRight)
        newPlayer.atBatsRight = Int32(atBatsRight)
        newPlayer.runsRight = Int32(runsRight)
        newPlayer.rbisRight = Int32(rbiRight)
        newPlayer.kRight = Int32(kRight)
        //RESET
        //GENERAL
        self.name = ""
        self.hits = 0
        self.walks = 0
        self.singles = 0
        self.doubles = 0
        self.triples = 0
        self.homeRuns = 0
        self.hbp = 0
        self.sacrifices = 0
        self.atBats = 0
        self.runs = 0
        self.k = 0
        //LEFT
        self.hitsLeft = 0
        self.walksLeft = 0
        self.singlesLeft = 0
        self.doublesLeft = 0
        self.triplesLeft = 0
        self.homeRunsLeft = 0
        self.hbpLeft = 0
        self.sacrificesLeft = 0
        self.atBatsLeft = 0
        self.runsLeft = 0
        self.kLeft = 0
        //RIGHT
        self.hitsRight = 0
        self.walksRight = 0
        self.singlesRight = 0
        self.doublesRight = 0
        self.triplesRight = 0
        self.homeRunsRight = 0
        self.hbpRight = 0
        self.sacrificesRight = 0
        self.atBatsRight = 0
        self.runsRight = 0
        self.kRight = 0
        //DO TRY CATCH
        do {
            try viewContext.save()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    private func addNewPitcher() {
        let inningsMathyMathForm: Double = Double(Int(inningsJockyJockForm * 10) % 10) / 3 + Double(Int(inningsJockyJockForm))
        
        let newPitcher = Pitcher(context: viewContext)
        newPitcher.pitcherName = pitcherName
        newPitcher.hitsAgainst = Int32(hitsAgainst)
        newPitcher.innings = inningsMathyMathForm
        newPitcher.earnedRuns = Int32(earnedRuns)
        newPitcher.bb = Int32(bb)
        newPitcher.strikeouts = Int32(strikeouts)
        newPitcher.pitchCount = Int32(pitchCount)
        newPitcher.atBatsPitcher = Int32(atBatsPitcher)
        newPitcher.hbpPitcher = Int32(hbpPitcher)
        newPitcher.wPitcher = Int32(wPitcher)
        newPitcher.lPitcher = Int32(lPitcher)
        
        self.pitcherName = ""
        self.hitsAgainst = 0
        self.inningsJockyJockForm = 0.0
        self.earnedRuns = 0
        self.bb = 0
        self.strikeouts = 0
        self.pitchCount = 0
        self.atBatsPitcher = 0
        self.hbpPitcher = 0
        self.wPitcher = 0
        self.lPitcher = 0
        
        do {
            try viewContext.save()
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
