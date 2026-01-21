import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';

class English {
  Map<String, String> get english => {
    // Error messages
    injectedAppTranslationKeys.unauthorizedSessionExpired: 'Unauthorized. Session expired',
    injectedAppTranslationKeys.noPermissionToAccess: 'No permission to access',
    injectedAppTranslationKeys.resourceNotFoundPleaseTryAgainLater: 'Resource not found. Please try again later',
    injectedAppTranslationKeys.serverErrorPleaseTryAgainLater: 'Server error. Please try again later',
    injectedAppTranslationKeys.regionNotValid: 'Region not valid',
    injectedAppTranslationKeys.unexpectedError: 'Unexpected error',
    injectedAppTranslationKeys.somethingWentWrong: 'Something went wrong',

    // Screen titles
    injectedAppTranslationKeys.upcomingMovies: 'Upcoming Movies',
    injectedAppTranslationKeys.searchMovies: 'Search Movies',
    injectedAppTranslationKeys.movieDetails: 'Movie Details',
    injectedAppTranslationKeys.selectSeats: 'Select Seats',
    injectedAppTranslationKeys.myBookings: 'My Bookings',

    // Bottom navigation
    injectedAppTranslationKeys.home: 'Home',
    injectedAppTranslationKeys.search: 'Search',
    injectedAppTranslationKeys.bookings: 'Bookings',

    // Buttons
    injectedAppTranslationKeys.watchTrailer: 'Watch Trailer',
    injectedAppTranslationKeys.bookTickets: 'Book Tickets',
    injectedAppTranslationKeys.proceedToPayment: 'Proceed to Payment',
    injectedAppTranslationKeys.retry: 'Retry',
    injectedAppTranslationKeys.loadMore: 'Load More',

    // Seat selection
    injectedAppTranslationKeys.available: 'Available',
    injectedAppTranslationKeys.selected: 'Selected',
    injectedAppTranslationKeys.occupied: 'Occupied',
    injectedAppTranslationKeys.disabled: 'Disabled',
    injectedAppTranslationKeys.screen: 'SCREEN',
    injectedAppTranslationKeys.selectedSeats: 'Selected Seats',
    injectedAppTranslationKeys.total: 'Total',

    // Movie info
    injectedAppTranslationKeys.overview: 'Overview',
    injectedAppTranslationKeys.language: 'Language',
    injectedAppTranslationKeys.votes: 'Votes',

    // Messages
    injectedAppTranslationKeys.noMoviesFound: 'No movies found',
    injectedAppTranslationKeys.searchForMovies: 'Search for movies',
    injectedAppTranslationKeys.failedToLoadMovies: 'Failed to load movies',
    injectedAppTranslationKeys.failedToSearchMovies: 'Failed to search movies',
    injectedAppTranslationKeys.failedToLoadMovieDetails: 'Failed to load movie details',
    injectedAppTranslationKeys.noBookingsYet: 'No bookings yet',
    injectedAppTranslationKeys.yourMovieBookingsWillAppearHere: 'Your movie bookings will appear here',
    injectedAppTranslationKeys.bookingConfirmed: 'Booking confirmed!',
    injectedAppTranslationKeys.resultsFound: 'Results Found',

    // Placeholders
    injectedAppTranslationKeys.searchMoviesPlaceholder: 'TV shows, movies and more',

    injectedAppTranslationKeys.dashboard: "Dashboard",
    injectedAppTranslationKeys.watch: "Watch",
    injectedAppTranslationKeys.mediaLib: "Media Library",
    injectedAppTranslationKeys.more: "More",

    // Coming soon
    injectedAppTranslationKeys.comingSoon: "Coming Soon",
    injectedAppTranslationKeys.comingSoonMessage: "This feature is under development and will be available soon.",
  };
}
