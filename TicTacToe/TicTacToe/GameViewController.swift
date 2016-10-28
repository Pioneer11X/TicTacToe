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
    
    let fontName = "AmericanTypewriter ";
    var screenSize: CGSize = CGSize(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height);
    
    private init() {
        // Nope.
    }
    
    static var gameData = GameData();
    
}

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
//            // Load the SKScene from 'GameScene.sks'
//            if let scene = SKScene(fileNamed: "HelloScene") {
//                // Set the scale mode to scale to fit the window
//                scene.scaleMode = .aspectFill
//                
//                // Present the scene
//                view.presentScene(scene)
//            }
            
            let scene = HelloScene(size: GameData.gameData.screenSize);
            scene.scaleMode = .aspectFill;
            view.presentScene(scene);
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
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
