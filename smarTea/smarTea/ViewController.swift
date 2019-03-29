//
//  ViewController.swift
//  Database ex
//
//  Created by Elliot Slack on 2/19/19.
//  Copyright © 2019 Elliot Slack. All rights reserved.
//

var global = "If you forget to remove your tea bag, your tea will be bitter."

import UIKit


class ViewController: UIViewController {
    

    
    
    
    
    
    @IBOutlet weak var lblHomeQuip: UILabel!
    var shareQuip: String!
    
    
    var quipString: String! = "Cuppa is British slang for Cup Of Tea"
    //quipString = global
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let fileManager = FileManager.default
        var sqliteDB: OpaquePointer? = nil
        var dbUrl: NSURL? = nil
        
        do {
            let baseUrl = try
                fileManager.url(for: .documentDirectory, in: .
                    userDomainMask, appropriateFor: nil, create:false)
            dbUrl = baseUrl.appendingPathComponent("sqift.sqlite") as NSURL
            
        }catch{
            print(error)
            
        }
        if let dbUrl = dbUrl{
            
            let flags = SQLITE_OPEN_CREATE | SQLITE_OPEN_READWRITE
            let status = sqlite3_open_v2(dbUrl.absoluteString?.cString(using: String.Encoding.utf8)!, &sqliteDB, flags, nil)
            if status == SQLITE_OK{
                
                let errMsg:UnsafeMutablePointer<UnsafeMutablePointer<Int8>?>? = nil
                
                let sqlStatement = "create table if not exists tea_quips (ID Integer Primary key, Quips Text);"
                if sqlite3_exec(sqliteDB, sqlStatement, nil, nil, errMsg) == SQLITE_OK{
                   // print("created table")
                }else{
                    //print("failed to create table.")
                }
                
                //validation
                var selectStatement1: OpaquePointer? = nil
                let selectSql1 = "select * from tea_quips"
                if sqlite3_prepare_v2(sqliteDB, selectSql1, -1, &selectStatement1, nil) == SQLITE_OK{
                    if sqlite3_step(selectStatement1) == SQLITE_ROW{
                        //no data available
                        
                    }
                    else{
                        
                        //inserting
                        var statement: OpaquePointer? = nil
                        let insertStatement = "insert into tea_quips (ID, Quips) values (1, 'There are two different words for tea: te-derived and cha-derived. The word a specific country uses for tea reveals where the country first acquired its tea.'),(2, 'Tea is the national drink in Iran and Afghanistan.'),(3, 'Tea in Russia has historically been prepared in a samovar, a heated metal container. The samovar keeps tea hot for hours.'),(4, 'Britain is the second-largest nation of tea drinkers per capita. Ireland is the first.'),(5, 'China is the world’s largest producer of tea. In 2009, China produced 1,359,000 tons.'),(6, 'It is widely believed that iced tea was invented in 1904 at the St. Louis World Fair by Richard Blechynden, a British tea merchant.'),(7, 'An estimated 85% of tea that is consumed in the United States is iced tea.'),(8, 'Over 1.42 million pounds of tea are consumed in the U.S. every day.'),(9, 'The Lipton Tea Factory in Jebel Ali, Dubai, produces 5 billion tea bags a year.'),(10, 'In 2005, the total value of the worldwide tea market was over $20 billion.'),(11, 'Tea is the most widely consumed beverage in the world, after water.),(12,Black tea undergoes the longest process of oxidation. White tea undergoes the shortest.'),(13, 'Because tea absorbs moisture, it is important to store loose tea or tea bags in a tin or sealed jar.'),(14, 'In the United States, the South and Northeast have the greatest concentration of tea drinkers.'),(15, 'It takes around four to 12 years for a tea plant to produce seed.'),(16, 'Tea plants need at least 50 inches of rain a year.'),(17, 'Most of the world’s tea is grown 3,000-7,000 feet above sea level and between the Tropic of Cancer and the Tropic of Capricorn.'),(18, 'Just the top 1 to 2 inches of a mature plant, or the flushes of the plant, are picked to make tea.'),(19, 'A tea plant can grow into a tree that is as tall as 52 feet if its leaves are not harvested.'),(20, 'Black tea is called “red tea” in China.'),(21, 'The most expensive tea in the world, Tieguanyin, is named after the Buddhist deity Guan Yin (Iron Goddess of Mercy).'),(22, 'Over 65% of tea brewed in the United States is prepared using tea bags.'),(23, 'The United States invented both the tea bag and iced tea in 1904.'),(24, 'More than 200 cups of tea can be brewed from one pound of loose tea leaves.'),(25, 'A cup of brewed tea usually contains less than half the caffeine of a cup of coffee.'),(26, 'Black tea constitutes around 75% of the world’s tea consumption.'),(27, 'White tea is the least processed type of tea.'),(28, 'In many parts of the world, tea is an important part of the day and an expression of hospitality.'),(29, 'When tea is being poured in China, guests tap two or three fingers on the table three times to show gratitude to the server.'),(30, 'All tea is made from the leaf of the plant Camellia sinensis. The specific types of tea are made by processing the tea leaves differently.'),(31, 'Although ready-to-drink teas and iced tea are increasing in popularity, they may not have the same polyphenol content as brewed hot tea, which has the highest polyphenol concentration.'),(32, 'The term “herbal tea” means that the tea has been infused with herbs or fruit that was not part of the tea plant. Herbal tea includes rosehip and chamomile teas.'),(33, 'Solid blocks of tea were used as money in Siberia until the 19th century.'),(34, 'While 1,120 liters of water go into producing a single liter of coffee, only 120 liters go into making the same amount of tea.'),(35, 'South Carolina is the only state that has a major tea plantation. It produces the brand American Classic, which has been the official White House tea since 1987.'),(36, 'Tea sets in the 18th century typically had numbered spoons to help the host remember which guest needed a refill.'),(37, 'Green tea is full of antioxidants which, when added to water, can help boost the health of plants.'),(38, 'If actors are required to drink whisky in a film or TV scene, they often are just drinking watered-down tea instead, which looks the same.'),(39, 'Though the Eastern world has been using tea for more than 4,500, tea was introduced to the West only 400 years ago.'), (40, 'Tea was a major factor in establishing connections between the East and West. It was also a catalyst for developing new technology, such as faster transport ships.'),(41, 'The most expensive teapot in the world is a rare pair of “melon” teapots from 18th century China. They sold for $2.18 million.'),(42, 'The song “I’m a Little Teapot, Short and Stout” was written in 1939 by Tin Pan Ally songwriters Clarence Kelley and George Harry Sanders.'),(43, 'Brits drink 165 million cups of tea a day.'),(44, 'Tea was first discovered in China by Shen Nung in 2737BC, who used it as an antidote to poisonous herbs.'),(45, 'Tea really took hold in the UK thanks to the British East India Company, which held a monopoly on Chinese tea in the eighteenth century.'),(46, 'Until Victorian times, English upper classes pronounced it ‘tay’.'),(47, 'Tea now grows in 52 countries – the oldest tree, in China, is 3,200 years old.'),(48, 'Scots have the sweetest tooth when it comes to their tea. 41% take sugar with their cuppa.'),(49, 'Ireland has the highest amount of tea consumption per person, with 75% of the population gulping down tea at an average of six cups a day.'),(50, 'Expenditure on coffee in Britain first overtook the amount spent on tea in 1998.'),(51, 'From 2010 to 2015 the consumption of tea in the UK fell by a fifth.'),(52, '7% of people are so picky about how they drink their tea they wouldn’t let anyone else make it for them.'),(53, 'Earl Grey was originally created in 1831 by Twinings for the Prime Minister at the time – the Earl Grey.'),(54, 'Teas of all varieties contain high levels of antioxidant polyphenols that can help keep your body healthier and may even ward off some cancers.'),(55, 'The amino acid L-theanine found in the tea plant can help you relax and concentrate more fully on tasks.'),(56, 'Drinking at least 2 cups of green tea daily may help reduce risk of cognitive impairment.'),(57, 'Tea makes everything better.  Black tea has been shown to reduce the effects of a stressful event.'),(58, 'Rooibos is an herbal tea that originated in Africa.'),(59, 'The caffeine contained in tea may give you the boost you need to improve your memory, at least for a few hours.'),(60, 'Some studies have found that drinkers of black tea were at a 70 percent lower risk of having a fatal heart attack.'),(61, 'Drinking only half a cup of green or oolong tea a day could reduce your risk of high blood pressure by up to 50%'),(62, 'Due to the high levels of tannins contained in tea, it can be used as a digestive aid.'),(63, 'Tea actually contains fluoride and tannins. Combined with a good dental hygiene regimen, this could keep your teeth healthier for longer.'),(64, 'Some studies suggest that green tea may be able to boost your metabolic rate slightly, allowing you to burn an additional 70-80 calories a day.'),(65, 'Black tea may bolster your efforts to fight the flu.');"
                        
                        sqlite3_prepare_v2(sqliteDB, insertStatement, -1, &statement, nil)
                        if sqlite3_step(statement) == SQLITE_DONE{
                            print("inserted")
                        }else{
                            print("not inserted")
                        }
                        sqlite3_finalize(statement)
                        //done inserting
                    }
                    
                    
                }
                sqlite3_finalize(selectStatement1)
                
                var selectStatement: OpaquePointer? = nil
                //var num:Int
                // num = 45
                // let randomInt = Int.random(in: 1...65)
                let dice1 = arc4random_uniform(65) + 1
                let selectSql = "select * from tea_quips where ID = \(dice1)"
                if sqlite3_prepare_v2(sqliteDB, selectSql, -1, &selectStatement, nil) == SQLITE_OK{
                    
                    while sqlite3_step(selectStatement) == SQLITE_ROW{
                        
                       // let rowId = sqlite3_column_int(selectStatement, 0)
                        
                        let quip = sqlite3_column_text(selectStatement,1)
                         quipString = String(cString: quip!)
                        global = quipString
                        

//                        }
                        
                        
                    }
                    
                }
                sqlite3_finalize(selectStatement)
                
            }
            
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}



