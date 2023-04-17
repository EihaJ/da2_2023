import 'package:get/get.dart';
import '../models/search_controller.dart';

class SearchController extends GetxController {
  final books = [
    Book('The Great Gatsby', 'F. Scott Fitzgerald'),
    Book('To Kill a Mockingbird', 'Harper Lee'),
    Book('1984', 'George Orwell'),
    Book('Pride and Prejudice', 'Jane Austen'),
  ];

  final searchText = ''.obs;

  List<Book> get filteredBooks => books
      .where((book) =>
          book.title.toLowerCase().contains(searchText.value.toLowerCase()) ||
          book.author.toLowerCase().contains(searchText.value.toLowerCase()))
      .toList();

  void search(String query) {
    searchText.value = query;
  }
}
