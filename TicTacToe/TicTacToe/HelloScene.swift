//
//  HelloScene.swift
//  TicTacToe
//
//  Created by Sravan Karuturi on 27/10/16.
//  Copyright © 2016 Sravan Karuturi. All rights reserved.
//

import Foundation
import SpriteKit;

class HelloScene: SKScene{
    
    var GameName: SKLabelNode;
    var singlePlayerButton: SKLabelNode;
    var multiPlayerButton: SKLabelNode;
    var optionsButton: SKLabelNode;
    var quitButton: SKLabelNode;
    
    var gameManager: GameViewController;
    
    init(size: CGSize, gameManager: GameViewController) {
        
        self.gameManager = gameManager;
        
        GameName = SKLabelNode(fontNamed: GameData.gameData.fontName);
        GameName.fontSize = 52;
        singlePlayerButton = SKLabelNode(fontNamed: GameData.gameData.fontName)
        multiPlayerButton = SKLabelNode(fontNamed: GameData.gameData.fontName)
        optionsButton = SKLabelNode(fontNamed: GameData.gameData.fontName)
        quitButton = SKLabelNode(fontNamed: GameData.gameData.fontName)
        
        
        super.init(size: size);
        
    }
    
    override func didMove(to view: SKView) {
        
        let labels: [SKLabelNode:String] = [GameName: "Tic Tac Toe", singlePlayerButton:"Single Player Game", multiPlayerButton:"Multiplayer Game", optionsButton:"Options", quitButton:"Quit"];
        
        
        self.fillLabels(labels: labels);
        
        self.GameName.position = CGPoint(x: self.size.width/2, y: 5 * self.size.height/6);
        self.singlePlayerButton.position = CGPoint(x: self.size.width/2, y: 4 * self.size.height/6);
        self.multiPlayerButton.position = CGPoint(x: self.size.width/2, y: 3 * self.size.height/6);
        self.optionsButton.position = CGPoint(x: self.size.width/2, y: 2 * self.size.height/6);
        self.quitButton.position = CGPoint(x: self.size.width/2, y: 1 * self.size.height/6);
        
        self.addChild(GameName);
        self.addChild(singlePlayerButton);
        self.addChild(multiPlayerButton);
        self.addChild(optionsButton);
        self.addChild(quitButton);
        
    }
    
    
    
    func fillLabels( labels: [SKLabelNode:String] ){
        var start:CGFloat = 1.0;
        for i in labels{
//            print(i.key.text);
            i.key.text = i.value;
            i.key.zPosition = 1.0;
//            i.key.position = CGPoint( x: self.size.width/2, y: self.size.height - ( start * self.size.height/7 ))
//            self.addChild(i.key);
            start += 1;
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            if singlePlayerButton.contains(touch.location(in: self)){
                print("ME VS AI");
                GameState.gameState.isMultiplayer = false;
            } else if multiPlayerButton.contains(touch.location(in: self)){
                self.gameManager.loadLevelScene();
                GameState.gameState.isMultiplayer = true;
                GameState.gameState.isPlayer1Turn = true;
            } else if optionsButton.contains(touch.location(in: self)){
                print("Options selected");
            } else if quitButton.contains(touch.location(in: self)){
                print("You sure?");
            }
        }
    }
    
}
