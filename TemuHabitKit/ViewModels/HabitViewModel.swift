import Foundation
import SwiftUI

class HabitViewModel: ObservableObject {
    @Published var habits: [Habit] = []

    private let saveKey = "SavedHabits"

    init() {
        loadHabits()
    }

    func addHabit(_ habit: Habit) {
        habits.append(habit)
        saveHabits()
    }

    func toggleCompletion(for habit: Habit) {
        if let index = habits.firstIndex(where: { $0.id == habit.id }) {
            habits[index].isCompleted.toggle()
            saveHabits()
        }
    }

    private func saveHabits() {
        if let data = try? JSONEncoder().encode(habits) {
            UserDefaults.standard.set(data, forKey: saveKey)
        }
    }

    private func loadHabits() {
        if let data = UserDefaults.standard.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode([Habit].self, from: data) {
            habits = decoded
        }
    }
}
