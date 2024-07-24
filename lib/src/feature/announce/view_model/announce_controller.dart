import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/entity/productRequestModel.dart';
import '../../../data/repository/app_repository_implementation.dart';

class ProductState {
  final bool isLoading;
  final String? responseMessage;

  ProductState({required this.isLoading, this.responseMessage});

  ProductState copyWith({bool? isLoading, String? responseMessage}) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      responseMessage: responseMessage ?? this.responseMessage,
    );
  }
}


final announceController = ChangeNotifierProvider((ref) => AnnounceController());
class AnnounceController with ChangeNotifier {
  bool isPressed = false;

  final TextEditingController priceController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController infoController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController maxSpeedController = TextEditingController();
  final TextEditingController powerController = TextEditingController();
  final TextEditingController luggageController = TextEditingController();


  late final AppRepositoryImpl productRepository;
  ProductState _state = ProductState(isLoading: false);

  ProductState get state => _state;

  Future<void> addProduct(ProductRequestModel product) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final String? response = await productRepository.postProductRequest(product);
      _state = _state.copyWith(
        isLoading: false,
        responseMessage: response != null
            ? 'Product added successfully: $response'
            : 'Product addition failed.',
      );
    } catch (e) {
      _state = _state.copyWith(
        isLoading: false,
        responseMessage: 'Product addition failed: $e',
      );
    }

    notifyListeners();
  }



  void onPressed() {
    isPressed = !isPressed;
    notifyListeners();
  }

  String? selectedYear;

  Future<void> pickYear(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      helpText: 'Select Year',
      fieldLabelText: 'Enter Year',
      initialEntryMode: DatePickerEntryMode.input,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            primaryColor: Colors.blue,
            hintColor: Colors.blue,
            colorScheme: const ColorScheme.light(primary: Colors.blue),
            buttonTheme: const ButtonThemeData(
                textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked.year.toString() != selectedYear) {
      selectedYear = picked.year.toString();
      notifyListeners();
    }
  }

  int selectedIndexCorpus = 0;


  void onTapCheckBox(bool value, int index) {
    if(value){
      selectedIndexCorpus = index;
      notifyListeners();

    }else {
      selectedIndexCorpus = 0;
      notifyListeners();

    }
  }
  int selectedIndexHolat = 0;


  void onTapCheckBoxHolat(bool value, int index) {
    if(value){
      selectedIndexHolat = index;
      notifyListeners();

    }else {
      selectedIndexHolat = 0;
      notifyListeners();

    }
  }
  int selectedIndexColor = 0;


  void onTapCheckBoxColor(bool value, int index) {
    if(value){
      selectedIndexColor = index;
      notifyListeners();

    }else {
      selectedIndexColor = 0;
      notifyListeners();

    }
  }
}
