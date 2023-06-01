//
//  MainMusicViewController.swift
//  Meditation
//
//  Created by Лада on 01.06.2023.
//

import UIKit
import AVFoundation

class MainMusicViewController: UIViewController {
    // MARK: - Properties

    var audioPlayer: AVAudioPlayer?
    var model: CharacterCell.Model
    private let audioURL: URL
    private let imageUrl: String
    private let trackName: String
    private let titleLabel = UILabel()
    
    private lazy var nameLabel = UILabel()
    private lazy var artistName = UILabel()
    private lazy var audio = UILabel()
    
    init(model: CharacterCell.Model) {
        self.model = model
        self.audioURL = URL(string: model.audio) ?? URL(fileURLWithPath: "")
        self.imageUrl = model.imageUrl
        self.trackName = model.name
        super.init(nibName: nil, bundle: nil)
     }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Elements

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.image = UIImage(named: "logo2")
        return imageView
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        return button
    }()

    private let pauseButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        button.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        return button
    }()

    private let previousButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        button.setImage(UIImage(systemName: "backward.fill"), for: .normal)
        return button
    }()

    private let nextButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        button.setImage(UIImage(systemName: "forward.fill"), for: .normal)
        return button
    }()

    private let volumeSlider: UISlider = {
        let slider = UISlider()
        return slider
    }()

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        setupAudioPlayer()
        configure(with: model)
    }

    // MARK: - UI Setup

    private func setup() {
        view.addSubview(imageView)
        view.addSubview(playButton)
        view.addSubview(pauseButton)
        view.addSubview(previousButton)
        view.addSubview(nextButton)
        view.addSubview(volumeSlider)
        view.addSubview(nameLabel)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        volumeSlider.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 350),
            imageView.widthAnchor.constraint(equalToConstant: 350),

            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
//            nameLabel.widthAnchor.constraint(equalToConstant: 200),
//            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 40),
//            playButton.widthAnchor.constraint(equalToConstant: 100),
//            playButton.heightAnchor.constraint(equalToConstant: 40),

            pauseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pauseButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 40),
//            pauseButton.widthAnchor.constraint(equalToConstant: 100),
//            pauseButton.heightAnchor.constraint(equalToConstant: 40),

            previousButton.trailingAnchor.constraint(equalTo: playButton.leadingAnchor, constant: -20),
            previousButton.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
//            previousButton.widthAnchor.constraint(equalToConstant: 100),
//            previousButton.heightAnchor.constraint(equalToConstant: 40),

            nextButton.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: 20),
            nextButton.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
//            nextButton.widthAnchor.constraint(equalToConstant: 100),
//            nextButton.heightAnchor.constraint(equalToConstant: 40),

            volumeSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            volumeSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            volumeSlider.topAnchor.constraint(equalTo: pauseButton.bottomAnchor, constant: 20)
        ])
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        pauseButton.addTarget(self, action: #selector(pauseButtonTapped), for: .touchUpInside)
        previousButton.addTarget(self, action: #selector(previousButtonTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        pauseButton.isHidden = true
    }
    
    @objc private func playButtonTapped() {
        pauseButton.isHidden = false
        playButton.isHidden = true
        audioPlayer?.play()
    }
    
    @objc private func pauseButtonTapped() {
        pauseButton.isHidden = true
        playButton.isHidden = false
        audioPlayer?.pause()
    }
    
    @objc private func previousButtonTapped() {
//        audioPlayer?.previous()
    }
    
    @objc private func nextButtonTapped() {
//        audioPlayer?.previous()
    }

    // MARK: - Audio Player Setup

    private func setupAudioPlayer() {
        guard let audioURL = URL(string: model.audio) else {
            print("Ошибка парсинга аудио URL")
            return
        }
//        guard let audioURL = audioURL else {
//            print("No audio URL provided")
//            return
//        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
            audioPlayer?.prepareToPlay()
        } catch {
            print("Failed to initialize audio player: \(error.localizedDescription)")
        }
    }
    
    private func loadImage() {
        guard let url = URL(string: imageUrl) else {
            print("Ошибка при создании URL для изображения")
            return
        }

        DispatchQueue.global().async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    if let image = UIImage(data: imageData) {
                        self?.imageView.image = image
                    }
                }
            } else {
                print("Ошибка при загрузке изображения")
            }
        }
    }
}

// MARK: - Configuration

extension MainMusicViewController {
    func configure(with model: CharacterCell.Model) {
        imageView.downloadImage(from: model.imageUrl)
        nameLabel.text = model.name
        artistName.text = model.artistName
        audio.text = model.audio
    }
}
