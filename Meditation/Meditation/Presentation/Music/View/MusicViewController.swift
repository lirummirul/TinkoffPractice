//
//  MusicViewController.swift
//  Meditation
//
//  Created by Лада on 30.05.2023.
//

import UIKit
import AVFoundation

protocol IView: AnyObject {
    func reloadData()
}

final class MusicViewController: UIViewController {
    // MARK: - LifeCycle
    private let output: MusicViewOutput
    private let presenter: IPresenter

    init(output: MusicViewOutput, presenter: IPresenter) {
        self.output = output
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - main
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        view.register(CharacterCell.self, forCellReuseIdentifier: String(describing: CharacterCell.self))
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .white
        setupUI()
        presenter.viewDidLoad()
    }
    
        // MARK: - Private
    
    private func setupUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension MusicViewController: IView {
    func reloadData() {
        tableView.reloadData()
    }
}

extension MusicViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(presenter.dataSource.count)
        return presenter.dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: CharacterCell.self),
            for: indexPath
        ) as? CharacterCell else { return UITableViewCell() }

        let model = presenter.dataSource[indexPath.row]
        cell.configure(with: model)

        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let model = presenter.dataSource[indexPath.row]
//        print("model \(model.audio)")
//        guard let audioURL = URL(string: model.audio) else {
//            print("Ошибка парсинга аудио URL")
//            return
//        }
//        print("audioURL \(audioURL)")
//
//        do {
//            try AVAudioSession.sharedInstance().setCategory(.playback)
//            try AVAudioSession.sharedInstance().setActive(true)
//        } catch {
//            print("Ошибка настройки AVAudioSession: \(error.localizedDescription)")
//        }
//
//        let player = AVPlayer(url: audioURL)
//        print("player \(player)")
//        player.play()
//        if let error = player.error {
//            print("Ошибка воспроизведения: \(error.localizedDescription)")
//        }
//
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = presenter.dataSource[indexPath.row]
//        guard let audioURL = URL(string: model.audio) else {
//            print("Ошибка парсинга аудио URL")
//            return
//        }
        
        let musicPlayerViewController = MainMusicViewController(model: model)
        navigationController?.pushViewController(musicPlayerViewController, animated: true)
    }

}

extension MusicViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        presenter.willDisplayForRowAt(indexPath: indexPath)
    }
}

extension MusicViewController: MusicViewInput { }
