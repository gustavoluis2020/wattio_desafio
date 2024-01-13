import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wattio_desafio/app/constants/app_colors.dart';
import 'package:wattio_desafio/app/ui/home_page/home_controller.dart';
import 'package:wattio_desafio/app/utils/app_validations.dart';
import 'package:wattio_desafio/app/widgets/app_button_loading.dart';
import 'package:wattio_desafio/app/widgets/app_text_field.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Text('Watt-io', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 20),
                    Image.asset('assets/images/energy.png', height: 50, width: 50),
                    const SizedBox(width: 20),
                    const Text('Energy', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  ]),
                  const SizedBox(height: 20),
                  const Text('Calcule sua economia baseado em seu consumo médio de energia elétrica.'),
                  const SizedBox(height: 20),
                  const Text('Selecione a forma de contratação.'),
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          activeColor: Colors.green,
                          value: controller.selectedFormOfHiring.value == 'PJ',
                          onChanged: (bool? value) {
                            if (value == true) {
                              controller.changeFormOfHiring('PJ');
                            }
                          },
                        ),
                        const Text('Pessoa Jurídica'),
                        const SizedBox(width: 20),
                        Checkbox(
                          activeColor: Colors.green,
                          value: controller.selectedFormOfHiring.value == 'PF',
                          onChanged: (bool? value) {
                            if (value == true) {
                              controller.changeFormOfHiring('PF');
                            }
                          },
                        ),
                        const Text('Pessoa Física'),
                      ],
                    );
                  }),
                  const Text('Selecione o plano de contrato.'),
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          activeColor: Colors.green,
                          value: controller.selectedContractPlan.value == 'Mensal',
                          onChanged: (bool? value) {
                            if (value == true) {
                              controller.changeContractPlan('Mensal');
                            }
                          },
                        ),
                        const Text('Mensal'),
                        Checkbox(
                          activeColor: Colors.green,
                          value: controller.selectedContractPlan.value == 'Trimestral',
                          onChanged: (bool? value) {
                            if (value == true) {
                              controller.changeContractPlan('Trimestral');
                            }
                          },
                        ),
                        const Text('Trimestral'),
                      ],
                    );
                  }),
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          activeColor: Colors.green,
                          value: controller.selectedContractPlan.value == 'Semestral',
                          onChanged: (bool? value) {
                            if (value == true) {
                              controller.changeContractPlan('Semestral');
                            }
                          },
                        ),
                        const Text('Semestral'),
                        Checkbox(
                          activeColor: Colors.green,
                          value: controller.selectedContractPlan.value == 'Anual',
                          onChanged: (bool? value) {
                            if (value == true) {
                              controller.changeContractPlan('Anual');
                            }
                          },
                        ),
                        const Text('Anual'),
                      ],
                    );
                  }),
                  const Text('Selecione o prazo de pagamento.'),
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          activeColor: Colors.green,
                          value: controller.selectedPaymentTerm.value == 15,
                          onChanged: (bool? value) {
                            if (value == true) {
                              controller.changePaymentTerm(15);
                            }
                          },
                        ),
                        const Text('Prazo de 15 dias'),
                        const SizedBox(width: 20),
                        Checkbox(
                          activeColor: Colors.green,
                          value: controller.selectedPaymentTerm.value == 30,
                          onChanged: (bool? value) {
                            if (value == true) {
                              controller.changePaymentTerm(30);
                            }
                          },
                        ),
                        const Text('Prazo de 30 dias'),
                      ],
                    );
                  }),
                  const SizedBox(height: 20),
                  const Text('Qual o seu consumo médio de energia elétrica?'),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: Get.width * 0.8,
                    child: AppTextFormField(
                      hintText: 'Valor:',
                      labelText: 'Valor:',
                      controller: controller.moneyValueController,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.number,
                      validator: AppValidations.amountValidator,
                      formatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CurrencyTextInputFormatter(
                          locale: 'pt-BR',
                          symbol: 'R\$',
                          enableNegative: false,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  AppButtonLoading(
                    width: Get.width * 0.8,
                    onTap: () {
                      controller.validadeValue();
                    },
                    isLoading: controller.isLoadingSaveMoney.value,
                    text: 'Calcular Ofertas',
                    color: AppColors.green,
                  ),
                  const SizedBox(height: 20),
                  Obx(() {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.filteredCompanies.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(controller.filteredCompanies[index].name),
                          subtitle: Text(
                              'Mínimo: ${controller.filteredCompanies[index].minimumValueMonth}, Máximo: ${controller.filteredCompanies[index].maximumValueMonth}'),
                        );
                      },
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
