import 'package:preguntasapp/models/question_model.dart';
import 'package:preguntasapp/enums/difficulty.dart';

abstract class BaseQuizRepository {
  Future<List<Question>> getQuestions({
    int numQuestions,
    int categoryId,
    Difficulty difficulty,
  });
}
