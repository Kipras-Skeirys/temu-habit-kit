import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: HabitViewModel

    @State private var title = ""
    @State private var emoji = ""
    @State private var selectedColor = "#FFD700"

    let colorOptions = ["#FFD700", "#FF7F50", "#87CEFA", "#90EE90", "#D8BFD8"]

    var body: some View {
        NavigationView {
            Form {
                TextField("Habit Title", text: $title)
                TextField("Emoji", text: $emoji)
                HStack {
                    Text("Color")
                    Spacer()
                    ForEach(colorOptions, id: \.self) { hex in
                        Circle()
                            .fill(Color(hex: hex))
                            .frame(width: 30, height: 30)
                            .overlay(Circle().stroke(Color.black.opacity(selectedColor == hex ? 1 : 0)))
                            .onTapGesture {
                                selectedColor = hex
                            }
                    }
                }
            }
            .navigationTitle("New Habit")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        let newHabit = Habit(
                            id: UUID(),
                            title: title,
                            emoji: emoji,
                            colorHex: selectedColor,
                            isCompleted: false
                        )
                        viewModel.addHabit(newHabit)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
