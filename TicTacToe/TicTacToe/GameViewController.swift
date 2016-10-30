//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Sravan Karuturi on 27/10/16.
//  Copyright © 2016 Sravan Karuturi. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

public class GameData{
    
    let fontName = "AmericanTypewriter";
    let fontNameBold = "AmericanTypewriter-Bold";
    var screenSize: CGSize = CGSize(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height);
    
    private init() {
        // Nope.
    }
    
    static var gameData = GameData();
    
}

public class GameState{
    
    var isMultiplayer = false;
    var isPlayer1Turn = false;
    var isPlayer2Turn = false;
    var isAITurn = false;
    
    private init(){
        // Nope.
    }
    
    static var gameState = GameState();
    
}

public class GameMatrix{
    
    var segments: [segmentFill] = [segmentFill.none, segmentFill.none, segmentFill.none,
                                   segmentFill.none, segmentFill.none, segmentFill.none,
                                   segmentFill.none, segmentFill.none, segmentFill.none];
    
    private init(){
        // Nope.
    }
    
    static var gameMatrix = GameMatrix();
    
}

enum segmentFill{
    case x;
    case o;
    case none;
}

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let view = self.view as! SKView? {
//            // Load the SKScene from 'GameScene.sks'
//            if let scene = SKScene(fileNamed: "HelloScene") {
//                // Set the scale mode to scale to fit the window
//                scene.scaleMode = .aspectFill
//                
//                // Present the scene
//                view.presentScene(scene)
//            }
            
//            let scene = HelloScene(size: GameData.gameData.screenSize, gameManager: self);
//            scene.scaleMode = .aspectFill;
//            view.presentScene(scene);
//            
//            view.ignoresSiblingOrder = true
//            
//            view.showsFPS = true
//            view.showsNodeCount = true
//        }
        
        loadHomeScene();
//        loadLevelScene();
        
    }
    
    func loadHomeScene(){
        let scene = HelloScene(size: GameData.gameData.screenSize, gameManager: self);
        scene.scaleMode = .aspectFill;
        if let view = self.view as! SKView? {
            view.presentScene(scene);
        }
    }
    
    func loadLevelScene(){
        let scene = LevelScene(size: GameData.gameData.screenSize, gameManager: self);
        scene.scaleMode = .aspectFill;
        if let view = self.view as! SKView? {
            view.presentScene(scene);
        }
    }
    
    func checkWinCondition() -> (Bool,segmentFill){
        // To check the win condition, We can do this, we select the diagonal row and check for each of those places if it is part of a win condition.
        
        // Listing all the win conditions
        if ( GameMatrix.gameMatrix.segments[0] == GameMatrix.gameMatrix.segments[1] ) && ( GameMatrix.gameMatrix.segments[0] == GameMatrix.gameMatrix.segments[2] ) && ( GameMatrix.gameMatrix.segments[0] != segmentFill.none ){
            // Win condition.
            return (true,GameMatrix.gameMatrix.segments[0]);
        }
        if ( GameMatrix.gameMatrix.segments[3] == GameMatrix.gameMatrix.segments[4] ) && ( GameMatrix.gameMatrix.segments[3] == GameMatrix.gameMatrix.segments[5] ) && ( GameMatrix.gameMatrix.segments[3] != segmentFill.none ){
            // Win condition.
            return (true,GameMatrix.gameMatrix.segments[3]);
        }
        if ( GameMatrix.gameMatrix.segments[6] == GameMatrix.gameMatrix.segments[7] ) && ( GameMatrix.gameMatrix.segments[6] == GameMatrix.gameMatrix.segments[8] ) && ( GameMatrix.gameMatrix.segments[6] != segmentFill.none ){
            // Win condition.
            return (true,GameMatrix.gameMatrix.segments[6]);
        }
        if ( GameMatrix.gameMatrix.segments[0] == GameMatrix.gameMatrix.segments[3] ) && ( GameMatrix.gameMatrix.segments[0] == GameMatrix.gameMatrix.segments[6] ) && ( GameMatrix.gameMatrix.segments[0] != segmentFill.none ){
            // Win condition.
            return (true,GameMatrix.gameMatrix.segments[0]);
        }
        if ( GameMatrix.gameMatrix.segments[1] == GameMatrix.gameMatrix.segments[4] ) && ( GameMatrix.gameMatrix.segments[1] == GameMatrix.gameMatrix.segments[7] ) && ( GameMatrix.gameMatrix.segments[1] != segmentFill.none ){
            // Win condition.
            return (true,GameMatrix.gameMatrix.segments[1]);
        }
        if ( GameMatrix.gameMatrix.segments[2] == GameMatrix.gameMatrix.segments[5] ) && ( GameMatrix.gameMatrix.segments[2] == GameMatrix.gameMatrix.segments[8] ) && ( GameMatrix.gameMatrix.segments[2] != segmentFill.none ){
            // Win condition.
            return (true,GameMatrix.gameMatrix.segments[2]);
        }
        if ( GameMatrix.gameMatrix.segments[0] == GameMatrix.gameMatrix.segments[4] ) && ( GameMatrix.gameMatrix.segments[0] == GameMatrix.gameMatrix.segments[8] ) && ( GameMatrix.gameMatrix.segments[0] != segmentFill.none ){
            // Win condition.
            return (true,GameMatrix.gameMatrix.segments[0]);
        }
        if ( GameMatrix.gameMatrix.segments[2] == GameMatrix.gameMatrix.segments[4] ) && ( GameMatrix.gameMatrix.segments[2] == GameMatrix.gameMatrix.segments[6] ) && ( GameMatrix.gameMatrix.segments[2] != segmentFill.none ){
            // Win condition.
            return (true,GameMatrix.gameMatrix.segments[2]);
        }else{
            return (false,GameMatrix.gameMatrix.segments[0]);
        }

    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
