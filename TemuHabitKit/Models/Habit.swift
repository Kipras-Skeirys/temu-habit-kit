import Foundation

struct Habit: Identifiable, Codable {
    // [ ] Add GitHub style history for recent 365 days
    let id: UUID
    var title: String
    var emoji: String
    var colorHex: String
    var isCompleted: Bool
}
