//
//  NetworkMonitor.swift
//  NetworkMonitor
//
//  Created by Alfian Losari on 11/08/24.
//

import Observation
import Network

@Observable
public class NetworkMonitor {

    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "com.xca.NetworkMonitor")
    private var pathStatus: NWPath.Status = .unsatisfied
    
    public var isReachable: Bool {
        pathStatus == .satisfied
    }
    
    public var statusText: String {
        switch pathStatus {
        case .satisfied:
            return "Connected"
        default :
            return "No Internet Connection"
        }
    }

    public init() {
        startMonitoring()
    }
    
    private func startMonitoring() {
        monitor.pathUpdateHandler = {path in
            Task { @MainActor [weak self] in
                
                self?.pathStatus = path.status
            }
        }
        monitor.start(queue: queue)
    }

    private func stopMonitoring() {
        monitor.cancel()
    }
    
    deinit {
        stopMonitoring()
    }
}

