//
//  VideosLaucher.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/13/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation


class TestVideoLaucher: UIView {
    var player: AVPlayer?
    var isPlaying: Bool = false
    var isTapedBackgroud: Bool = false {
        didSet {
            if isTapedBackgroud {
                currentTimeLB.isHidden = false
                maxTimeLb.isHidden = false
                slider.isHidden = false
                pausePlayBtn.isHidden = false
                backBtn.isHidden = false
                nextBtn.isHidden = false
            } else {
                currentTimeLB.isHidden = true
                maxTimeLb.isHidden = true
                slider.isHidden = true
                pausePlayBtn.isHidden = true
                backBtn.isHidden = true
                nextBtn.isHidden = true
            }
        }
    }
    let indicator: UIActivityIndicatorView = {
        let ind = UIActivityIndicatorView(style: .large)
        ind.translatesAutoresizingMaskIntoConstraints = false
        ind.startAnimating()
        return ind
    }()
    let pausePlayBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(Resource.Image.pauseImg, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(onTapPauseBtn(_:)), for: .touchUpInside)
        btn.isHidden = true
        return btn
    }()
    let backBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(Resource.Image.backImg, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(onTapBackBtn(_:)), for: .touchUpInside)
        btn.isHidden = true
        return btn
    }()
    let nextBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(Resource.Image.nextImg, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(onTapNextBtn(_:)), for: .touchUpInside)
        btn.isHidden = true
        return btn
    }()
    let contrainerV: UIView = {
       let v = UIView()
        v.backgroundColor = UIColor(white: 0, alpha: 1)
        return v
    }()
    let maxTimeLb: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let slider: UISlider = {
       let slider = UISlider()
        slider.tintColor = .red
        slider.thumbTintColor = .red
        slider.minimumTrackTintColor = .red
        slider.maximumTrackTintColor = .white
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(onChangeValueSlider), for: .valueChanged)
        return slider
    }()
    let currentTimeLB: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()

    let stackV: UIStackView = {
       let stkV = UIStackView()
        stkV.translatesAutoresizingMaskIntoConstraints = false
        stkV.distribution = .fillProportionally
        stkV.axis = .horizontal
        return stkV
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setupPlayVideo()
        contrainerV.frame = self.frame
        self.addSubview(contrainerV)
        setupTapGesture(view: contrainerV, selector: #selector(onTapBackGroudVideo), target: self)
        //add indicator
        contrainerV.addSubview(indicator)
        indicator.centerXAnchor.constraint(equalTo: contrainerV.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: contrainerV.centerYAnchor).isActive = true
        //add pause and play button
        contrainerV.addSubview(stackV)

        stackV.leadingAnchor.constraint(equalTo: contrainerV.leadingAnchor).isActive = true
        stackV.trailingAnchor.constraint(equalTo: contrainerV.trailingAnchor).isActive = true
        stackV.centerXAnchor.constraint(equalTo: contrainerV.centerXAnchor).isActive = true
        stackV.centerYAnchor.constraint(equalTo: contrainerV.centerYAnchor).isActive = true

        stackV.addArrangedSubview(backBtn)
        stackV.addArrangedSubview(pausePlayBtn)
        stackV.addArrangedSubview(nextBtn)

        //add label min max
        contrainerV.addSubview(maxTimeLb)
        self.setupLabelFor(lable: maxTimeLb, text: "00:00", textColor: .white, font: .systemFont(ofSize: 17))
        maxTimeLb.trailingAnchor.constraint(equalTo: contrainerV.trailingAnchor, constant: -5).isActive = true
        maxTimeLb.bottomAnchor.constraint(equalTo: contrainerV.bottomAnchor, constant: -5).isActive = true

        contrainerV.addSubview(currentTimeLB)
        self.setupLabelFor(lable: currentTimeLB, text: "00.00", textColor: .white, font: .systemFont(ofSize: 18))
        currentTimeLB.leadingAnchor.constraint(equalTo: contrainerV.leadingAnchor, constant: 5).isActive = true
        currentTimeLB.bottomAnchor.constraint(equalTo: contrainerV.bottomAnchor, constant: -5).isActive = true

        //add slier
        contrainerV.addSubview(slider)
        slider.trailingAnchor.constraint(equalTo: maxTimeLb.leadingAnchor, constant: -10).isActive = true
        slider.bottomAnchor.constraint(equalTo: contrainerV.bottomAnchor).isActive = true
        slider.leadingAnchor.constraint(equalTo: currentTimeLB.trailingAnchor, constant: 10).isActive = true
        slider.heightAnchor.constraint(equalToConstant: 30).isActive = true



       //add Pangesture
        self.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(onPanGestureContainerV(panGes:))))
    }
    @objc func onPanGestureContainerV(panGes: UIPanGestureRecognizer) {
            let translation = panGes.translation(in: panGes.view)
            switch panGes.state {
            case .began, .changed:
                print("began")
                if self.frame.minX <= (superview?.frame.minX)! {
                    self.center.y += translation.y
                    if self.frame.minY < superview!.frame.minY {
                        self.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 9/16)
                    }
                }
            case .ended:
                print("end")

            default:
                break
            }

        }
    
    func setupPlayVideo() {

        guard let mainUrl = URL(string: "https://devstreaming-cdn.apple.com/videos/wwdc/2016/102w0bsn0ge83qfv7za/102/hls_vod_mvp.m3u8") else {return}
        player = AVPlayer(url: mainUrl)
        let playerPlayer = AVPlayerLayer(player: player)
        self.layer.addSublayer(playerPlayer)
        playerPlayer.frame = self.frame
        player?.play()
        player?.addObserver(self, forKeyPath: "currentItem.loadedTimeRanges", options: .new, context: nil)

        let interval = CMTime(value: 1, timescale: 2)

        //lay time hien tai cho lable curent
        player?.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: { (progressTime) in
            let seconds = CMTimeGetSeconds(progressTime)
            let secondsString = String(format: "%02d", Int(seconds) % 60)
            let minuteString = String(format: "%02d", Int(seconds) / 60)

            self.currentTimeLB.text = "\(minuteString):\(secondsString)"

            //keo thanh slider
            if let duration = self.player?.currentItem?.duration {
                let duraTionSeconds = CMTimeGetSeconds(duration)
                self.slider.value = Float(seconds / duraTionSeconds)
            }
        })
    }

    //MARK: OnTap button playvideo
    @objc func onTapBackBtn(_ sender: UIButton) {

    }

    @objc func onTapNextBtn(_ sender: UIButton) {

    }

    @objc func onTapPauseBtn(_ sender: UIButton) {
        if isPlaying {
          player?.pause()
          pausePlayBtn.setImage(Resource.Image.playImg, for: .normal)
        } else {
          player?.play()
          pausePlayBtn.setImage(Resource.Image.pauseImg, for: .normal)
        }
        isPlaying = !isPlaying
        print(isPlaying)
    }


    @objc func onChangeValueSlider() {
        // slider tu dong chay
        if let duration = player?.currentItem?.duration {
            let totalSecond = CMTimeGetSeconds(duration)
            let value = Double(slider.value) * totalSecond
            let seekTime = CMTime(value: Int64(value), timescale: 1)
            player?.seek(to: seekTime, completionHandler: { (handle) in
            })
        }
    }

    @objc func onTapBackGroudVideo() {
        isTapedBackgroud = !isTapedBackgroud
        print(isTapedBackgroud)
    }

    // when the videos is start so indicator hiden
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {

        // khi video chay thi no se setup ui duoi nay
        if keyPath == "currentItem.loadedTimeRanges" {
            indicator.stopAnimating()
            contrainerV.backgroundColor = .clear
            isPlaying = true
            if let duration = player?.currentItem?.duration {
                let durationBySeconds = CMTimeGetSeconds(duration)
                let minute = Int(durationBySeconds) / 60
                let secondsText = Int(durationBySeconds) % 60
                maxTimeLb.text = "\(minute):\(secondsText)"
            }
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class TestVideosLaucher: NSObject {
 
    func showVideo() {
        if let keyWindow = UIApplication.shared.keyWindow {
            let view = UIView(frame: keyWindow.frame)
            view.backgroundColor = .white
            keyWindow.addSubview(view)
            let videoPlayerV = TestVideoLaucher(frame: .init(x: 0, y: 0, width: keyWindow.frame.width, height: keyWindow.frame.width * 9/16))

            keyWindow.addSubview(videoPlayerV)
            view.frame = .init(x: keyWindow.frame.minX, y: keyWindow.frame.maxY, width: keyWindow.frame.width, height: 0 )
           
            
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                view.frame = keyWindow.frame

            }) { (completed) in
                UIApplication.shared.setStatusBarHidden(true, with: .fade)
            }
        }
    }
    
}


