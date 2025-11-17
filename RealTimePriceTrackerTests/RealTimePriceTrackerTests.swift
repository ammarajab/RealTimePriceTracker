import Combine
import Foundation
import Testing
@testable import RealTimePriceTracker

final class MockPriceService: PriceStreaming {
    let updatesSubject = PassthroughSubject<PriceUpdate, Never>()
    let statusSubject = PassthroughSubject<ConnectionStatus, Never>()

    var updates: AnyPublisher<PriceUpdate, Never> { updatesSubject.eraseToAnyPublisher() }
    var status: AnyPublisher<ConnectionStatus, Never> { statusSubject.eraseToAnyPublisher() }

    func start() {}
    func stop() {}
}

struct RealTimePriceTrackerTests {
    @Test func updatesReorderQuotesByPrice() async throws {
        let mock = MockPriceService()
        let viewModel = await MainActor.run {
            PriceFeedViewModel(
                service: mock,
                symbols: ["AAA", "BBB"],
                descriptions: ["AAA": "Alpha", "BBB": "Beta"]
            )
        }

        let firstUpdate = PriceUpdate(symbol: "AAA", price: 120, timestamp: Date())
        let secondUpdate = PriceUpdate(symbol: "BBB", price: 260, timestamp: Date())

        await MainActor.run {
            mock.statusSubject.send(.connected)
            mock.updatesSubject.send(firstUpdate)
            mock.updatesSubject.send(secondUpdate)
        }

        try await Task.sleep(nanoseconds: 100_000_000)

        await MainActor.run {
            #expect(viewModel.quotes.first?.symbol == "BBB")
            #expect(viewModel.quotes.first?.price == secondUpdate.price)
            #expect(viewModel.quotes.first?.lastMovement == .up)
        }
    }
}
