//
//  TestVideosLaucher.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/19/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import AVFoundation

class VideosLaucher: UIViewController {
    @IBOutlet weak var detailV: UIView!
    @IBOutlet weak var viewsLb: UILabel!
    @IBOutlet weak var titleVideoLb: UILabel!
    @IBOutlet weak var heightVideoPlayerV: NSLayoutConstraint!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var currentTimeLb: UILabel!
    @IBOutlet weak var sliderTime: UISlider!
    @IBOutlet weak var totalTimeLb: UILabel!
    @IBOutlet weak var backBtn: UIImageView!
    @IBOutlet weak var pausePlayBtn: UIImageView!
    @IBOutlet weak var nextBtn: UIImageView!
    @IBOutlet weak var controllerV: UIView!
    @IBOutlet weak var videoPlayerV: UIView!
    //MARK: Probertis
    var player: AVPlayer?
    var playerPlayer: AVPlayerLayer!
    var isPlaying: Bool = false
    var isTapedBackgroud: Bool = true {
        didSet {
            controllerV.isHidden = !isTapedBackgroud
        }
    }
    
    var isHideDetailV: Bool = false {
        didSet {
            if isHideDetailV {
                detailV.isHidden = true
            } else {
                detailV.isHidden = false
                detailV.alpha = 1
            }
        }
    }
    
    var video: Videos?
    
    private func setData() {
        guard let title = self.video?.title else {return}
        titleVideoLb.text = title
        guard let views = self.video?.views else {return}
        viewsLb.text = "\(views.toThoudsandDecima() ?? "")" + " views"
    }
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlayVideo()
        setData()
        customItemsVieosPlyer()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        videoPlayerV.frame = .init(x: 0, y: self.view.safeAreaInsets.top, width: self.view.frame.width, height: self.view.frame.width * 9/16)
        controllerV.frame = videoPlayerV.frame
        playerPlayer.frame = self.videoPlayerV.bounds
    }
    
    private func customItemsVieosPlyer() {
        isTapedBackgroud = true
        indicator.startAnimating()
        controllerV.backgroundColor = UIColor(white: 0, alpha: 1)
    
        backBtn.setupTapGesture(view: backBtn, selector: #selector(onTapBackBtn), target: self)
        pausePlayBtn.setupTapGesture(view: pausePlayBtn, selector: #selector(onTapPausePlayBtn), target: self)
        nextBtn.setupTapGesture(view: nextBtn, selector: #selector(onTapNextBtn), target: self)
        sliderTime.addTarget(self, action: #selector(onChangeValueSlider), for: .valueChanged)
        
        controllerV.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(onPanGetureVideos(_:))))
        videoPlayerV.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(onPanGetureVideos(_:))))
        videoPlayerV.setupTapGesture(view: videoPlayerV, selector: #selector(onTapVideoPlayer), target: self)
        videoPlayerV.isUserInteractionEnabled = true
        controllerV.isUserInteractionEnabled = true
    }
    
    private func setupPlayVideo() {
        guard let mainUrl = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") else {return}
        player = AVPlayer(url: mainUrl)
        playerPlayer = AVPlayerLayer(player: player)
        videoPlayerV.layer.addSublayer(playerPlayer)
        playerPlayer.contentsGravity = .resize
        player?.play()
        player?.addObserver(self, forKeyPath: "currentItem.loadedTimeRanges", options: .new, context: nil)
        let interval = CMTime(value: 1, timescale: 2)
        //Get time currentLb
        player?.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: { (progressTime) in
        let seconds = CMTimeGetSeconds(progressTime)
        let secondsString = String(format: "%02d", Int(seconds) % 60)
        let minuteString = String(format: "%02d", Int(seconds) / 60)
        self.currentTimeLb.text = "\(minuteString):\(secondsString)"
        //pull sliderTime
        if let duration = self.player?.currentItem?.duration {
        let duraTionSeconds = CMTimeGetSeconds(duration)
            self.sliderTime.value = Float(seconds / duraTionSeconds)
            }
        })
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        //Observable video
        if keyPath == "currentItem.loadedTimeRanges" {
            indicator.stopAnimating()
            indicator.isHidden = true
            controllerV.backgroundColor = .clear
            isPlaying = true
            isTapedBackgroud = false
            if let duration = player?.currentItem?.duration {
                let durationBySeconds = CMTimeGetSeconds(duration)
                let minute = Int(durationBySeconds) / 60
                let secondsText = Int(durationBySeconds) % 60
                totalTimeLb.text = "\(minute):\(secondsText)"
            }
        }
    }
    
    //MARK: Handle tap
    @objc func onTapBackBtn() {
        let currentTime = CMTimeGetSeconds((player?.currentTime())!)
        var backwardTime = 0
        if currentTime < 10 {
            backwardTime = 0
        } else {
            backwardTime = Int(currentTime - 10)
        }
        player?.seek(to: CMTime(seconds: Double(backwardTime), preferredTimescale: 1), completionHandler: { (Bool) in
        })
    }
    
    @objc func onTapPausePlayBtn() {
        if isPlaying {
            player?.pause()
            pausePlayBtn.image = Resource.Image.playImg
        } else {
            player?.play()
            pausePlayBtn.image = Resource.Image.pauseImg
        }
        isPlaying = !isPlaying
    }
    
    @objc func onTapNextBtn() {
        let duration = player?.currentItem?.duration
        let totalSecond = CMTimeGetSeconds(duration!)
        let currentTime = CMTimeGetSeconds((player?.currentTime())!)
        var nextTime = 0
        if currentTime + 10 >= totalSecond  {
            nextTime = Int(totalSecond)
        } else {
            nextTime = Int(currentTime + 10)
        }
        player?.seek(to: CMTime(seconds: Double(nextTime), preferredTimescale: 1), completionHandler: { (Bool) in
        })
    }
    
    @objc func onChangeValueSlider() {
        // slider auto run
        if let duration = player?.currentItem?.duration {
            let totalSecond = CMTimeGetSeconds(duration)
            let value = Double(sliderTime.value) * totalSecond
            let seekTime = CMTime(value: Int64(value), timescale: 1)
            player?.seek(to: seekTime, completionHandler: { (handle) in
            })
        }
    }
    
    @objc func onPanGetureVideos(_ ges: UIPanGestureRecognizer) {
        let translation = ges.translation(in: ges.view)
        
        switch ges.state {
        case .began, .changed:
            controllerV.isHidden = true
            self.videoPlayerV.center.y += translation.y
            //prevent pull up
            if self.videoPlayerV.frame.minY <= self.view.safeAreaInsets.top {
                if self.view.frame.minY <= self.view.safeAreaInsets.top {
                    self.videoPlayerV.frame = .init(x: 0, y: self.view.safeAreaInsets.top, width: self.view.frame.width, height: self.view.frame.width * 9/16)
                } else {
                    self.videoPlayerV.frame = .init(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: self.videoPlayerV.frame.height - 10)
                    self.videoPlayerV.layoutIfNeeded()
                }
                
            } else {
                self.view.frame = .init(x: self.view.frame.origin.x + 0.1, y: self.view.frame.origin.y + translation.y, width: self.view.frame.width - 0.2, height: self.view.frame.height - translation.y)
                detailV.alpha -= 0.01
                
                if self.view.frame.minY >= UIScreen.main.bounds.height / 3 {
                    UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                        self.view.frame = .init(x: 10, y: UIScreen.main.bounds.height / 1.4, width: UIScreen.main.bounds.width - 20, height: self.view.frame.width / 2)
                        self.videoPlayerV.frame = self.view.frame
                        self.isHideDetailV = true
                        self.view.layoutIfNeeded()
                        return
                    }, completion: nil)
                }
            }

        case .ended:
            if self.view.frame.minY >= self.view.frame.width / 4 {
                //update frame for self.view
                isHideDetailV = true
                self.controllerV.isHidden = true
                UIView.animate(withDuration: 0.3) {
                    self.view.frame = .init(x: 10, y: UIScreen.main.bounds.height / 1.45, width: UIScreen.main.bounds.width - 20, height: self.view.frame.width / 2)
                    self.view.transform = CGAffineTransform(scaleX: 1, y: 0.55)
                    self.videoPlayerV.frame = self.view.frame
                    return
                }
            } else {
                self.view.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                isHideDetailV = false
            }
            break
        default:
           break
        }
        ges.setTranslation(.zero, in: ges.self.view)
    }

    @objc func onTapVideoPlayer() {
        isTapedBackgroud.toggle()
        if self.view.frame.minY > UIScreen.main.bounds.height / 2 {
            self.view.transform = .identity
            self.view.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            self.controllerV.isHidden = false
            isHideDetailV = false
        }
    }
}
