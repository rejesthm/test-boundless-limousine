import 'package:flutter/material.dart';
import 'package:test_repo_example/common/styles/app_colors.dart';
import 'package:test_repo_example/common/styles/app_spacing.dart';
import 'package:test_repo_example/common/utils/validator_utils.dart';
import 'package:test_repo_example/common/widgets/app_outlined_field.dart';

class PersonalInformationWidget extends StatelessWidget {
  const PersonalInformationWidget({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VerticalSpace(AppSpacing.lg),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AppOutlinedField(
                controller: firstNameController,
                labelText: 'First name',
                leadingIcon: Icon(Icons.person, color: CustomAppColors.primary),
                validator: ValidatorUtil.instance.validateFirstName,
                height: 56,
              ),
            ),
            const HorizontalSpace(AppSpacing.lg),
            Expanded(
              child: AppOutlinedField(
                controller: lastNameController,
                labelText: 'Last name',
                leadingIcon: Icon(Icons.person, color: CustomAppColors.primary),
                validator: ValidatorUtil.instance.validateLastName,
                height: 56,
              ),
            ),
          ],
        ),
        const VerticalSpace(AppSpacing.lg),
        AppOutlinedField(
          controller: emailController,
          labelText: 'name@example.com',
          leadingIcon: Icon(Icons.mail, color: CustomAppColors.primary),
          keyboardType: TextInputType.emailAddress,
          validator: ValidatorUtil.instance.validateEmail,
          height: 56,
        ),
      ],
    );
  }
}
