//
//  ViewController.swift
//  Tretinder
//
//  Created by Jimy Suenaga on 04/01/18.
//  Copyright © 2018 Jimysses. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // static samples. move to models and then api fetch data
    var index = 0
    var brawlTitles = ["DUELIN #001", "DUELIN #002", "DUELIN #003", "DUELIN #004"]
    var brawlCategories = ["Melhor refrigerante?", "Melhor fast-food?", "Melhor jogo?", "Melhor empresa?"]
    var playerUserHasVoted = ["", "", "right",""]
    var brawlPlayers = [["cocacola", "pepsi"], ["mcdonalds", "bk"], ["lol", "dota"], ["querobolsa", "educamais"]]
    var playersImages = [["coke", "pepsi"], ["mcdonalds", "bk"], ["lol", "dota"], ["querobolsa", "educamais"]]
    var playersBgColors = [["FFFFFF", "202FFF"], ["FF0000", "FFFFFF"] , ["FFFFFF", "0E1111"],["FFFFFF", "FFFF75"]]
    var sampleVotes = [[0, 0], [80, 50], [49,50], [10000,0]]
    
    var braws:[Brawl] = [
        Brawl(id: 1, name: "TRETA #001", category: "Bebidas", left_player_id: 1, right_player_id: 2, left_vote_count: 0, right_vote_count: 0, user_id: 1),
        Brawl(id: 2, name: "TRETA #002", category: "Restaurantes", left_player_id: 3, right_player_id: 4, left_vote_count: 80, right_vote_count: 50, user_id: 1),
        Brawl(id: 3, name: "TRETA #003", category:"Jogos", left_player_id: 5, right_player_id: 6, left_vote_count: 50, right_vote_count: 50, user_id: 1),
        Brawl(id: 4, name: "TRETA #003", category: "Educação", left_player_id: 7, right_player_id: 8, left_vote_count: 1000, right_vote_count: 0, user_id: 1)
    ]
    var players:[Player] = [
        Player(id: 1, name: "cocacola", image: "coke", description: ""),
        Player(id: 2, name: "pepsi", image: "pepsi", description: ""),
        Player(id: 3, name: "mcdonalds", image: "mcdonalds", description: ""),
        Player(id: 4, name: "bk", image: "bk", description: ""),
        Player(id: 5, name: "lol", image: "lol", description: ""),
        Player(id: 6, name: "dota", image: "dota", description: ""),
        Player(id: 7, name: "querobolsa", image: "querobolsa", description: ""),
        Player(id: 8, name: "educamais", image: "educamais", description: "")
    ]
    
    @IBOutlet weak var brawlTitleLabel: UILabel!
    @IBOutlet weak var brawlCategoryLabel: UILabel!
    
    @IBOutlet weak var leftPlayerName: UILabel!
    @IBOutlet weak var rightPlayerName: UILabel!
    
    @IBOutlet weak var leftPlayerImage: UIButton!
    @IBOutlet weak var rightPlayerImage: UIButton!
    @IBOutlet weak var leftVoteButton: UIButton!
    @IBOutlet weak var rightVoteButton: UIButton!
    
    @IBOutlet weak var brawlBgView: Quadrilateral!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "\(brawlTitles[index]) !"
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"",style:.plain,target:nil,action:nil)
       
        
        // Swipe recognizers
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        loadBrawl()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // swipeListener
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
                index = (index + 1) % brawlTitles.count
                loadBrawl()
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right")
                index = index - 1
                if(index < 0){
                    index = brawlTitles.count - 1
                }
                loadBrawl()
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
            default:
                break
            }
        }
    }
    
    // segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "voteSegue"){
            print("bla")
        }
    }
    
    func loadBrawl(){
        self.navigationItem.title = "\(brawlTitles[index])"

        self.brawlCategoryLabel.text = brawlCategories[index]
        
        self.leftPlayerName.text = brawlPlayers[index][0]
        self.rightPlayerName.text = brawlPlayers[index][1]
        
        self.leftPlayerImage.setImage(UIImage(named: playersImages[index][0]), for: .normal)
        self.rightPlayerImage.setImage(UIImage(named: playersImages[index][1]), for: .normal)
        
        self.leftPlayerImage.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        self.rightPlayerImage.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        
        self.brawlBgView.color = UIColor.init(hexString: playersBgColors[index][0])
        self.brawlBgView.backgroundColor = UIColor.init(hexString: playersBgColors[index][1])
        
        //TODO: use pallete of colors in external file
        if(playerUserHasVoted[index].isEmpty){
            leftVoteButton.backgroundColor = UIColor.init(hexString: "6996CC")
            rightVoteButton.backgroundColor = UIColor.init(hexString: "6996CC")
        }else{
            if(playerUserHasVoted[index] == "left"){
                leftVoteButton.backgroundColor = UIColor.gray
                rightVoteButton.backgroundColor = UIColor.init(hexString: "6996CC")
            }else{
                leftVoteButton.backgroundColor = UIColor.init(hexString: "6996CC")
                rightVoteButton.backgroundColor = UIColor.gray
            }
        }
        
        updateVoteCount()
    }
    
    @IBAction func leftVote(_ sender: Any) {
        // user has already voted
        if(playerUserHasVoted[index] == "left"){
            return
        }
        
        playerUserHasVoted[index] = "left"
        if(sampleVotes[index][1] > 0){
            sampleVotes[index][1] -= 1
        }
        sampleVotes[index][0] += 1
        
        leftVoteButton.backgroundColor = UIColor.blue
        
        updateVoteCount()
        vote_message(name: brawlPlayers[index][0])
        
    }
    
    @IBAction func rightVote(_ sender: Any) {
        // user has already voted
        if(playerUserHasVoted[index] == "right"){
            return
        }

        playerUserHasVoted[index] = "right"
        if(sampleVotes[index][0] > 0){
            sampleVotes[index][0] -= 1
        }
        sampleVotes[index][1] += 1

        rightVoteButton.backgroundColor = UIColor.blue
        
        updateVoteCount()
        vote_message(name: brawlPlayers[index][1])
        
    }
    
    func vote_message(name: String){
        let alertController = UIAlertController(title:"Match!", message:"Agora sou #team-\(name)\n\(brawlPlayers[index][0]): \(sampleVotes[index][0]) votos\n\(brawlPlayers[index][1]): \(sampleVotes[index][1]) votos", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: skipButton))
        present(alertController, animated: true, completion: nil)
    }
    
    func updateVoteCount(){
//        self.leftVoteCountLabel.text = "\(leftVoteCount) VOTOS"
//        self.rightVoteCountLabel.text = "\(rightVoteCount) VOTOS"
    }
    
//    func updatePercentage(){
//        let leftVoteCount = sampleVotes[index][0]
//        let rightVoteCount = sampleVotes[index][1]
//        let totalVotes = Float(leftVoteCount + rightVoteCount)
//        if(totalVotes == 0){
//            self.leftVotePercentage.text = String(format: "%.2f%%", 0.0)
//            self.rightVotePercentage.text = String(format: "%.2f%%", 0.0)
//            self.percentageBar.progress = 0.0
//            return
//        }
//        self.leftVotePercentage.text = String(format: "%.2f%%", 100 * (Float(leftVoteCount) / totalVotes))
//        self.rightVotePercentage.text = String(format: "%.2f%%", 100 * (Float(rightVoteCount) / totalVotes))
//        self.percentageBar.progress = Float(leftVoteCount) / totalVotes
//    }
    
    //unwind comment modal
    @IBAction func closeCommentModal(segue:UIStoryboardSegue){
        
    }
    
    //unwind information modal
    @IBAction func closeInfoModal(segue:UIStoryboardSegue){
        
    }
    
    @IBAction func skipButton(_ sender: Any) {
        index = (index + 1) % brawlTitles.count
        
        loadBrawl()
    }
}

