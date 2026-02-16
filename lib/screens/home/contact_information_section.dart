import 'package:flutter/material.dart';
import 'package:test_repo_example/common/styles/app_spacing.dart';
import 'package:test_repo_example/common/utils/phone_input_formatter.dart';
import 'package:test_repo_example/common/utils/validator_utils.dart';
import 'package:test_repo_example/common/widgets/app_outlined_field.dart';
import 'package:test_repo_example/common/widgets/section_title.dart';

class ContactInformationWidget extends StatelessWidget {
  const ContactInformationWidget({super.key, required this.phoneController});

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle('Contact Information'),
        const VerticalSpace(AppSpacing.lg),
        AppOutlinedField(
          controller: phoneController,
          validator: ValidatorUtil.instance.validatePhone,
          inputFormatters: PhoneInputFormatter.formatters,
          keyboardType: TextInputType.phone,
          leadingIcon: Image.asset(
            'assets/icons/united-states.png',
            width: 8,
            height: 8,
          ),
        ),
      ],
    );
  }
}
