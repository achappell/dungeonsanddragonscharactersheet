//
//  Races+FEMMappingTests.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/4/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import XCTest
@testable import DungeonsDragonsCC

class RacesFEMMappingTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {

        let bundle = Bundle(for: CoreRulebookFEMMappingTests.self)
        let path = bundle.path(forResource: "testcorerulebook", ofType: "json")

        let data = try? Data(contentsOf: URL(fileURLWithPath: path!))

        do {
            let JSONDict = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]


            let deserializer = JSONDeserializer()

            if let book = JSONDict["coreRulebook"] as? [String: AnyObject], let races = book["races"] as? [[String: AnyObject]] {
                let race = deserializer.objectFromDictionary(races[0], classType: Race.self)! as Race

                XCTAssertEqual(race.name, "Dwarf")
                XCTAssertEqual(race.adventures, "Although dwarven adventurers are rare compared to humans, they can be found in most regions of the world. Dwarves often leave the confines of their redoubts to seek glory for their clans, to find wealth with which to enrich the fortress-homes of their birth, or to reclaim fallen dwarven citadels from racial enemies. Dwarven warfare is often characterized by tunnel fighting and melee combat, and as such most dwarves tend toward classes such as fighters and barbarians.")
                XCTAssertEqual(race.physicalDescription, "Dwarves are a short and stocky race, and stand about a foot shorter than most humans, with wide, compact bodies that account for their burly appearance. Male and female dwarves pride themselves on the length of their hair, and men often decorate their beards with a variety of clasps and intricate braids. A clean-shaven male dwarf is a sure sign of madness, or worse—no one familiar with their race trusts a beardless dwarf.")
                XCTAssertEqual(race.alignmentAndReligion, "Dwarves are driven by honor and tradition, and while they are often satirized as standoffish, they have a strong sense of friendship and justice, and those who win their trust understand that, while they work hard, they play even harder—especially when good ale is involved. Most dwarves are lawful good.")
                XCTAssertEqual(race.relations, "Dwarves and orcs have long dwelt in proximity, theirs a history of violence as old as both their races. Dwarves generally distrust and shun half-orcs. They find halflings, elves, and gnomes to be too frail, flighty, or “pretty” to be worthy of proper respect. It is with humans that dwarves share the strongest link, for humans' industrious nature and hearty appetites come closest to matching those of the dwarven ideal.")
                XCTAssertEqual(race.society, "The great distances between their mountain citadels account for many of the cultural differences that exist within dwarven society. Despite these schisms, dwarves throughout the world are characterized by their love of stonework, their passion for stone- and metal-based craftsmanship and architecture, and a fierce hatred of giants, orcs, and goblinoids.")
            }
        } catch {

        }
    }
}
