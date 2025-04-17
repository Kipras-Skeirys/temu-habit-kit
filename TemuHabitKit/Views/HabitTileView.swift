import SwiftUI

struct HabitTileView: View {
    var habit: Habit

    var body: some View {
        HStack {
            Text(habit.emoji)
                .font(.largeTitle)
            Text(habit.title)
                .font(.headline)
            Spacer()
            if habit.isCompleted {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            }
        }
        .padding()
        .background(Color(hex: habit.colorHex))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}

