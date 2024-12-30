class StringFunction {
  String allFirstCharacterUppercase(String text) {
    List arrayPieces = [];

    String outPut = '';

    String newText =
        text.replaceAll('-', ' '); // it returns the string   'résumé'

    newText.split(' ').forEach((sepparetedWord) {
      arrayPieces.add(sepparetedWord);
    });

    for (var word in arrayPieces) {
      word =
          "${word[0].toString().toUpperCase()}${word.toString().substring(1)} ";
      outPut += word;
    }

    return outPut;
  }
}
