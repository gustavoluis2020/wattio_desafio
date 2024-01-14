// ignore_for_file: unrelated_type_equality_checks

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wattio_desafio/app/constants/app_colors.dart';
import 'package:wattio_desafio/app/ui/home_page/components/card_discount.dart';
import 'package:wattio_desafio/app/ui/home_page/home_controller.dart';
import 'package:wattio_desafio/app/utils/app_converters.dart';
import 'package:wattio_desafio/app/utils/app_validations.dart';
import 'package:wattio_desafio/app/widgets/app_button_loading.dart';
import 'package:wattio_desafio/app/widgets/app_shimmer.dart';
import 'package:wattio_desafio/app/widgets/app_text_field.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Form(
          key: controller.formKeyUserLogin,
          child: SafeArea(
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
                    const Text('Calcule sua economia baseado em seu consumo médio de energia elétrica.',
                        textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 20),
                    const Text('Selecione a forma de contratação.',
                        textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
                    Obx(() {
                      return Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        surfaceTintColor: AppColors.white,
                        child: Row(
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
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                    const Text('Selecione o tempo do contrato.',
                        textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      surfaceTintColor: AppColors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Selecione o prazo de pagamento.',
                        textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
                    Obx(() {
                      return Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        surfaceTintColor: AppColors.white,
                        child: Row(
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
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                    const Text('Qual o valor do seu consumo médio de energia elétrica?',
                        textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: Get.width,
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
                    Obx(() {
                      return AppButtonLoading(
                        width: Get.width,
                        onTap: () {
                          controller.validadeCompanys();
                          FocusScope.of(context).unfocus();
                        },
                        isLoading: controller.isLoadingCompanys.value,
                        text: 'Buscar Ofertas',
                        color: AppColors.green,
                      );
                    }),
                    const SizedBox(height: 20),
                    Obx(() {
                      if (!controller.isLoaded.value) {
                        return const SizedBox.shrink();
                      } else if (controller.isLoadingCompanys.value) {
                        return AppShimmer(index: 2, height: 120, width: Get.width);
                      } else if (controller.filteredCompanies.isEmpty) {
                        return const Center(
                          child: Text('Opções não encontradas!', style: TextStyle(fontSize: 16)),
                        );
                      } else {
                        return Column(
                          children: [
                            controller.filteredCompanies.isEmpty
                                ? const SizedBox()
                                : const Text('Selecione uma da(s) empresa(s) abaixo para calcular seu desconto!',
                                    textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.filteredCompanies.length,
                              itemBuilder: (context, index) {
                                final company = controller.filteredCompanies[index];
                                return Obx(() {
                                  return GestureDetector(
                                    onTap: () {
                                      controller.selectedIndex.value = index;
                                      controller.discount = company.discount;
                                      controller.contractPlan = company.contractPlan;
                                      controller.nameCompany.value = company.name;
                                      controller.calculateValue();
                                    },
                                    child: Card(
                                      surfaceTintColor: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(
                                            color:
                                                controller.selectedIndex == index ? Colors.black : Colors.transparent),
                                      ),
                                      margin: const EdgeInsets.symmetric(vertical: 10),
                                      elevation: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Empresa: ${company.name}'),
                                            Text('Desconto:  ${AppConverters.formatarPorcentagem(company.discount)}'),
                                            Text('Forma de Contrato: ${company.formOfHiring}'),
                                            Text('Tempo de Contrato: ${company.contractPlan}'),
                                            Text('Avaliação: ${company.assessments.toString()}'),
                                            Text('Prazo de pagamento: ${company.paymentTerm.toString()} dias'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                              },
                            ),
                          ],
                        );
                      }
                    }),
                    const SizedBox(height: 20),
                    Obx(() {
                      if (controller.isLoadingSaveContract.value) {
                        return AppShimmer(index: 1, height: 250, width: Get.width);
                      } else if (controller.discountAmount.value == 0.0) {
                        return const SizedBox.shrink();
                      } else {
                        return CardDiscount(
                          discountAmount: AppConverters.doubleToRealString(controller.discountAmount.value),
                          valueDescont: AppConverters.doubleToRealString(controller.valueDescont.value),
                          nameCompany: controller.nameCompany.value,
                          discount: AppConverters.formatarPorcentagem(controller.discount),
                          months: controller.months.value.toString(),
                          isLoading: controller.isLoadingCompanys.value,
                          onTap: () {
                            controller.validadeCompanyContract();
                          },
                        );
                      }
                    })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
