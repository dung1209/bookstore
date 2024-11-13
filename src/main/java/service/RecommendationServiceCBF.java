package service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.AccDao;
import Dao.BooksDao;
import bookstorePTIT.bean.Books;

import java.util.*;

@Service
public class RecommendationServiceCBF {

	BooksDao booksDao = new BooksDao();
    // Xây dựng vector TF-IDF cho mô tả sách
    private Map<String, Double> buildTFIDFVector(String description, List<Books> allBooks) {
        Map<String, Integer> termFrequency = new HashMap<>();
        Map<String, Double> tfidfVector = new HashMap<>();

        // Chia nhỏ mô tả thành các từ
        String[] words = description.split("\\W+");
        for (String word : words) {
            word = word.toLowerCase();
            termFrequency.put(word, termFrequency.getOrDefault(word, 0) + 1);
        }

        // Tính TF cho mỗi từ
        for (Map.Entry<String, Integer> entry : termFrequency.entrySet()) {
            double tf = (double) entry.getValue() / words.length;
            tfidfVector.put(entry.getKey(), tf);
        }

        // Tính IDF cho mỗi từ trong tất cả các sách
        for (String word : termFrequency.keySet()) {
            int docFrequency = 0;
            for (Books book : allBooks) {
                if (book.getTitle().toLowerCase().contains(word)) {
                    docFrequency++;
                }
            }
            double idf = Math.log((double) allBooks.size() / (docFrequency + 1));
            tfidfVector.put(word, tfidfVector.get(word) * idf); // Cập nhật TF-IDF
        }

        return tfidfVector;
    }

    // Tính cosine similarity giữa 2 vector TF-IDF
    private double computeCosineSimilarity(Map<String, Double> vector1, Map<String, Double> vector2) {
        Set<String> allWords = new HashSet<>();
        allWords.addAll(vector1.keySet());
        allWords.addAll(vector2.keySet());

        double dotProduct = 0;
        double magnitude1 = 0;
        double magnitude2 = 0;

        for (String word : allWords) {
            double tfidf1 = vector1.getOrDefault(word, 0.0);
            double tfidf2 = vector2.getOrDefault(word, 0.0);

            dotProduct += tfidf1 * tfidf2;
            magnitude1 += tfidf1 * tfidf1;
            magnitude2 += tfidf2 * tfidf2;
        }

        return dotProduct / (Math.sqrt(magnitude1) * Math.sqrt(magnitude2));
    }

    // Gợi ý sách dựa trên mô tả nội dung
    public List<Books> getRecommendations(Books currentBook) {
        List<Books> allBooks = booksDao.getBooks(); // Lấy tất cả sách từ database
        List<Books> recommendedBooks = new ArrayList<>();

        // Xây dựng vector TF-IDF cho sách hiện tại
        Map<String, Double> currentBookVector = buildTFIDFVector(currentBook.getTitle(), allBooks);

        for (Books book : allBooks) {
            if (book.getbookID() != currentBook.getbookID()) {
                // Xây dựng vector TF-IDF cho sách khác
                Map<String, Double> otherBookVector = buildTFIDFVector(book.getTitle(), allBooks);

                // Tính toán độ tương đồng cosine
                double similarity = computeCosineSimilarity(currentBookVector, otherBookVector);

                // Thêm sách vào danh sách gợi ý nếu độ tương đồng > 0.1 (hoặc tùy chỉnh mức độ tương đồng)
                if (similarity > 0.1) {
                    recommendedBooks.add(book);
                }
            }
        }

        return recommendedBooks;
    }
}

