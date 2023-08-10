//
//  Presenter.swift
//  Meditation
//
//  Created by Лада on 31.05.2023.
//

import Foundation

protocol IPresenter: AnyObject {
    var dataSource: [CharacterCell.Model] { get set }
    func viewDidLoad()
    func willDisplayForRowAt(indexPath: IndexPath)
}

final class Presenter: IPresenter {
    
    // Dependencies
    weak var view: IView?
    private let networkService: INetworkService
    
    // Properties
    var dataSource: [CharacterCell.Model] = []
    private var page = 1
    private var isLoading = false
    
    // MARK: - Initialization
    
    init(networkService: INetworkService) {
        self.networkService = networkService
    }
    
    // MARK: - IPresenter
    
    func viewDidLoad() {
        obtainData()
    }
    
    func willDisplayForRowAt(indexPath: IndexPath) {
        if indexPath.row == dataSource.count - 1 {
            page += 1
            obtainData()
        }
    }
    
    // MARK: - Private
    
    private func obtainData() {
        guard !isLoading else { return }
        isLoading = true
        networkService.getCharacters(page: page) { [weak self] (characters: [Character]) in
            var viewModels: [CharacterCell.Model] = []
            for character in characters {
                for track in character.tracks {
                    let viewModel = CharacterCell.Model(imageUrl: track.image,
                                                       name: track.name,
                                                        artistName: track.artistName, audio: track.audio)
                    viewModels.append(viewModel)
                }
            }
            self?.dataSource += viewModels
            self?.view?.reloadData()
            self?.isLoading = false
        }
    }
}
