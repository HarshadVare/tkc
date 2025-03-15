import 'package:flutter/material.dart';
import 'package:tkc/config/app_text.dart';
import 'package:tkc/config/app_text_field.dart';
import 'package:tkc/config/dropdown_form_field.dart';
import 'package:tkc/features/Home/presentation/view/widgets/common_button.dart';
import 'package:tkc/theme/app_colors.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();

  String _calculatedValue = "0";

  void _updateLabel() {
    double qty = double.tryParse(_qtyController.text) ?? 0;
    double amount = double.tryParse(_amountController.text) ?? 0;
    setState(() {
      _calculatedValue = (qty * amount).toString();
      print(_calculatedValue);
    });
  }

  @override
  void initState() {
    super.initState();
    _qtyController.addListener(_updateLabel);
    _amountController.addListener(_updateLabel);
  }

  @override
  void dispose() {
    _qtyController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                        text: 'Add Purchased Item',
                        color: AppColors.blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                CustomDropdown(
                  label: "--select Item--",
                  value: null,
                  items: [
                    DropdownMenuItem(
                        value: "Parle Biscuit", child: Text('Parle Biscuit')),
                    DropdownMenuItem(value: "Sugar", child: Text('Sugar')),
                    DropdownMenuItem(
                        value: "Chicken King", child: Text('Chicken King')),
                  ],
                  onChanged: (val) {
                    print("Selected: $val");
                  },
                  error: "Please select an item",
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: AppTextFiled(
                          label: "Quantity",
                          controller: _qtyController,
                          type: TextInputType.number,
                          error: "Invalid User ID"),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomDropdown(
                        label: "--select unit--",
                        value: null,
                        items: [
                          DropdownMenuItem(
                              value: "kg", child: Text('Kilogram (kg)')),
                          DropdownMenuItem(value: "g", child: Text('Gram (g)')),
                          DropdownMenuItem(
                              value: "mg", child: Text('Milligram (mg)')),
                          DropdownMenuItem(
                              value: "ton", child: Text('Ton (ton)')),
                          DropdownMenuItem(
                              value: "L", child: Text('Liter (L)')),
                          DropdownMenuItem(
                              value: "mL", child: Text('Milliliter (mL)')),
                          DropdownMenuItem(
                              value: "pcs", child: Text('Piece (pcs)')),
                          DropdownMenuItem(
                              value: "pkt", child: Text('Packet (pkt)')),
                          DropdownMenuItem(
                              value: "dz", child: Text('Dozen (dz)')),
                        ],
                        onChanged: (val) {
                          print("Selected: $val");
                        },
                        error: "Please select",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                AppTextFiled(
                    label: "Amount Per Unit",
                    controller: _amountController,
                    type: TextInputType.number,
                    error: "required"),
                SizedBox(
                  height: 16,
                ),
                AppTextFiled(
                    hint: "Total: $_calculatedValue",
                    // label: _calculatedValue,
                    // controller: _amountController,
                    isEnableField: false,
                    type: TextInputType.number,
                    error: "required"),
                SizedBox(
                  height: 16,
                ),
                CommonButton(text: 'Add', onTap: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
