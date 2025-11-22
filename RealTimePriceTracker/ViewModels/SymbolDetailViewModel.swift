import SwiftUI

struct SymbolDetailViewModel: QuoteDisplayProviding {
    let quote: StockQuote

    var descriptionText: String {
        quote.description
    }
}
