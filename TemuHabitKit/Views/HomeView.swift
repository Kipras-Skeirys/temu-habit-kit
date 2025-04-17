import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HabitViewModel()
    @State private var showingAddHabit = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(viewModel.habits) { habit in
                        HabitTileView(habit: habit)
                            .onTapGesture {
                                viewModel.toggleCompletion(for: habit)
                            }
                    }
                }
                .padding()
            }
            .navigationTitle("My Habits")
            .toolbar {
                Button {
                    showingAddHabit.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddHabitView(viewModel: viewModel)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
