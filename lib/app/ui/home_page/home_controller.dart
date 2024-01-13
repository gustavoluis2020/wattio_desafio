import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wattio_desafio/app/model/company_model.dart';

class HomeController extends GetxController {
  TextEditingController moneyValueController = TextEditingController();

  RxBool isLoadingSaveMoney = false.obs;

  List<CompanyModel> companies = [];

  Future<void> readJson() async {
    try {
      final String response = await rootBundle.loadString('assets/json/companys.json');
      final Map<String, dynamic> jsonMap = json.decode(response);

      final List<dynamic> companyListJson = jsonMap['company'];
      companies = companyListJson.map((json) {
        json['minimum_value_month'] = json['minimum_value_month'].toDouble();
        json['maximum_value_month'] = json['maximum_value_month'].toDouble();
        return CompanyModel.fromJson(json);
      }).toList();

      // companies = companyListJson.map((json) => CompanyModel.fromJson(json)).toList();
      debugPrint(companies.length.toString());
    } catch (e) {
      debugPrint('Erro ao ler o arquivo JSON: $e');
    }
  }

  @override
  void onInit() {
    // readJson();
    super.onInit();
  }

  void validadeValue() {
    readJson().then((_) {
      filterCompanies();
    });
    //filterCompanies();
    // readJson();
  }

  ///form_of_hiring
  RxString selectedFormOfHiring = ''.obs;

  void changeFormOfHiring(String value) {
    selectedFormOfHiring.value = value;
    debugPrint(selectedFormOfHiring.value);
  }

  ///contract_plan
  RxString selectedContractPlan = ''.obs;

  void changeContractPlan(String value) {
    selectedContractPlan.value = value;
    debugPrint(selectedContractPlan.value);
  }

  /// payment_term
  RxInt selectedPaymentTerm = 0.obs;

  void changePaymentTerm(int value) {
    selectedPaymentTerm.value = value;
    debugPrint(selectedPaymentTerm.value.toString());
  }

  /// clean e convertion R$ to double
  double getDoubleValue(TextEditingController? controller) {
    try {
      if (controller == null || controller.text.isEmpty) {
        return 1.0;
      } else {
        String currentValue = controller.text;
        String onlyDigits = currentValue.replaceAll(RegExp('[^0-9]'), '');
        double doubleValue = double.parse(onlyDigits) / 100;
        return doubleValue;
      }
    } catch (e) {
      debugPrint('Erro ao converter o valor: $e');
      return 0.0;
    }
  }

  int getIntValue(TextEditingController? controller) {
    try {
      if (controller == null || controller.text.isEmpty) {
        return 1;
      } else {
        String currentValue = controller.text;
        String onlyDigits = currentValue.replaceAll(RegExp('[^0-9]'), '');
        int intValue = int.parse(onlyDigits);
        debugPrint(intValue.toString());
        return intValue;
      }
    } catch (e) {
      debugPrint('Erro ao converter o valor: $e');
      return 0;
    }
  }

  List<CompanyModel> applyFilters({
    double? minValue,
    double? maxValue,
    String? contractPlan,
    String? formOfHiring,
    int? paymentTerm,
  }) {
    return companies.where((company) {
      // // Filtro de valor mínimo
      // if (minValue != null && company.minimumValueMonth < minValue) {
      //   print('Valor mínimo não atendido: ${company.minimumValueMonth} < $minValue');
      //   return false;
      // }

      // // Filtro de valor máximo
      // if (maxValue != null && company.maximumValueMonth > maxValue) {
      //   print('Valor máximo não atendido: ${company.maximumValueMonth} > $maxValue');
      //   return false;
      // }

      // Verificação adicional para o valor estar entre mínimo e máximo
      if (minValue != null &&
          maxValue != null &&
          (company.minimumValueMonth > minValue || company.maximumValueMonth < maxValue)) {
        print(
            'Valor não está entre mínimo e máximo: ${company.minimumValueMonth} > $minValue OR ${company.maximumValueMonth} < $maxValue');
        return false;
      }

      // Filtro de plano de contrato
      // if (contractPlan != null && company.contractPlan != contractPlan) {
      //   print('Plano de contrato não atendido: ${company.contractPlan} != $contractPlan');
      //   return false;
      // }

      // Filtro de prazo de pagamento
      if (paymentTerm != null && company.paymentTerm != paymentTerm) {
        print('Prazo de pagamento não atendido: ${company.paymentTerm} != $paymentTerm');
        return false;
      }

      // Filtro de forma de contratação
      if (formOfHiring != null && company.formOfHiring != formOfHiring) {
        print('Forma de contratação não atendida: ${company.formOfHiring} != $formOfHiring');
        return false;
      }

      if (contractPlan != null && company.contractPlan != contractPlan) {
        print('Plano de contrato não atendido: ${company.contractPlan} != $contractPlan');
        return false;
      }

      // Se passou por todos os filtros, inclui a empresa na lista filtrada
      return true;
    }).toList();
  }

  RxList<CompanyModel> filteredCompanies = <CompanyModel>[].obs;
  void filterCompanies() {
    try {
      double typedValue = getDoubleValue(moneyValueController);

      double? minValue = typedValue;
      double? maxValue = typedValue;
      String? contractPlan = selectedContractPlan.value;

      String? formOfHiring = selectedFormOfHiring.value;

      int? paymentTerm = selectedPaymentTerm.value;

      filteredCompanies.value = applyFilters(
        minValue: minValue,
        maxValue: maxValue,
        contractPlan: contractPlan,
        formOfHiring: formOfHiring,
        paymentTerm: paymentTerm,
      );

      print(filteredCompanies.length);
    } catch (e) {
      debugPrint('Erro ao filtrar as empresas: $e');
    }
  }
}
