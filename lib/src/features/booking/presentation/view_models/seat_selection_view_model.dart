import 'package:flutter/foundation.dart';

enum SeatStatus { available, selected, occupied, disabled }

enum SeatType { regular, vip }

class Seat {
  final String id;
  final int row;
  final int column;
  SeatStatus status;
  final SeatType type;

  Seat({
    required this.id,
    required this.row,
    required this.column,
    this.status = SeatStatus.available,
    this.type = SeatType.regular,
  });

  int get price => type == SeatType.vip ? 150 : 50;
}

class SeatSelectionViewModel extends ChangeNotifier {
  final List<List<Seat>> _seats = [];
  final List<Seat> _selectedSeats = [];

  List<List<Seat>> get seats => _seats;
  List<Seat> get selectedSeats => _selectedSeats;
  int get totalPrice {
    return _selectedSeats.fold(0, (sum, seat) => sum + seat.price);
  }

  SeatSelectionViewModel() {
    _initializeSeats();
  }

  void _initializeSeats() {
    // Create a 10x8 grid of seats
    const rows = 10;
    const columns = 8;

    for (int row = 0; row < rows; row++) {
      final seatRow = <Seat>[];
      for (int col = 0; col < columns; col++) {
        final seatType = _getSeatType(row, col);
        final seat = Seat(
          id: '${col + 1} / ${row + 1} row',
          row: row,
          column: col,
          status: _getInitialSeatStatus(row, col),
          type: seatType,
        );
        seatRow.add(seat);
      }
      _seats.add(seatRow);
    }
    notifyListeners();
  }

  SeatType _getSeatType(int row, int col) {
    // Last row (row 9, index 9) and some seats in row 8 (index 8) are VIP
    if (row >= 8) {
      return SeatType.vip;
    }
    return SeatType.regular;
  }

  SeatStatus _getInitialSeatStatus(int row, int col) {
    // Randomly mark some seats as occupied for demo
    if ((row + col) % 7 == 0) {
      return SeatStatus.occupied;
    }
    // Mark some seats as disabled
    if ((row + col) % 11 == 0) {
      return SeatStatus.disabled;
    }
    return SeatStatus.available;
  }

  void toggleSeatSelection(int row, int column) {
    if (row >= _seats.length || column >= _seats[row].length) return;

    final seat = _seats[row][column];

    if (seat.status == SeatStatus.occupied ||
        seat.status == SeatStatus.disabled) {
      return;
    }

    if (seat.status == SeatStatus.selected) {
      seat.status = SeatStatus.available;
      _selectedSeats.remove(seat);
    } else {
      seat.status = SeatStatus.selected;
      _selectedSeats.add(seat);
    }

    notifyListeners();
  }

  void clearSelection() {
    for (final seat in _selectedSeats) {
      seat.status = SeatStatus.available;
    }
    _selectedSeats.clear();
    notifyListeners();
  }

  bool canProceed() {
    return _selectedSeats.isNotEmpty;
  }
}
