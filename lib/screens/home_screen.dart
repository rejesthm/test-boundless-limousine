import 'package:flutter/material.dart';
import 'package:test_repo_example/common/styles/app_colors.dart';
import 'package:test_repo_example/common/styles/app_spacing.dart';
import 'package:test_repo_example/common/utils/validator_utils.dart';
import 'package:test_repo_example/common/widgets/app_outlined_field.dart';
import 'package:test_repo_example/common/widgets/app_segmented_control.dart';
import 'package:test_repo_example/common/widgets/section_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  int _tripTypeIndex = 0;
  int _pickupLocationTypeIndex = 0;
  int _dropOffLocationTypeIndex = 0;

  final _dateController = TextEditingController(text: '05/13/2023');
  final _timeController = TextEditingController(text: '3:00 PM');
  final _pickupLocationController = TextEditingController(
    text: 'Clintons Bar & Grille, High Street, Clinton, MA, USA',
  );
  final _dropOffLocationController = TextEditingController(
    text: 'Logan Airport Terminal B, Boston, MA, USA',
  );
  final _phoneController = TextEditingController(text: '+1 774 415 3244');
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passengersController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    _pickupLocationController.dispose();
    _dropOffLocationController.dispose();
    _phoneController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passengersController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColors.formBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.space20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpace(AppSpacing.xl),
                _buildHeader(context),
                const VerticalSpace(AppSpacing.xl),
                _buildMainHeading(context),
                const VerticalSpace(AppSpacing.xl),
                _buildTripTypeToggle(context),
                const VerticalSpace(AppSpacing.xl),
                _buildPickupSection(context),
                const VerticalSpace(AppSpacing.xl),
                _buildDropOffSection(context),
                const VerticalSpace(AppSpacing.xl),
                _buildContactSection(context),
                const VerticalSpace(AppSpacing.xl),
                _buildPassengersSection(context),
                const VerticalSpace(AppSpacing.xxl),
                _buildContinueButton(context),
                const VerticalSpace(AppSpacing.xxxl),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.speed_outlined,
            color: CustomAppColors.formTextSecondary,
            size: 26,
          ),
          const HorizontalSpace(AppSpacing.sm),
          Text(
            'ExampleIQ',
            style: theme.textTheme.titleLarge?.copyWith(
              color: CustomAppColors.formTextSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainHeading(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      "Let's get you on your way!",
      style: theme.textTheme.headlineMedium?.copyWith(
        color: CustomAppColors.formTextPrimary,
        fontWeight: FontWeight.w300,
      ),
      textAlign: TextAlign.left,
    );
  }

  Widget _buildTripTypeToggle(BuildContext context) {
    return AppSegmentedControl(
      labels: const ['One-way', 'Hourly'],
      icons: const [Icons.arrow_forward, Icons.hourglass_empty],
      selectedIndex: _tripTypeIndex,
      onChanged: (i) => setState(() => _tripTypeIndex = i),
      size: SegmentControlSize.medium,
    );
  }

  Widget _buildPickupSection(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('Pickup'),
        const VerticalSpace(AppSpacing.lg),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: CustomAppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: CustomAppColors.formBorder,
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.all(AppSpacing.sm),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: CustomAppColors.toggleSelectedGold,
                      size: 20,
                    ),
                    const HorizontalSpace(AppSpacing.sm),
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: CustomAppColors.formBorder,
                            width: 1,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                        ),
                        child: Text(
                          _dateController.text,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const HorizontalSpace(AppSpacing.lg),
            Expanded(
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: CustomAppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: CustomAppColors.formBorder,
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: CustomAppColors.formTextHint,
                      size: 20,
                    ),
                    const HorizontalSpace(AppSpacing.md),
                    Text(
                      _timeController.text,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const VerticalSpace(AppSpacing.lg),
        AppSegmentedControl(
          labels: const ['Location', 'Airport'],
          selectedIndex: _pickupLocationTypeIndex,
          onChanged: (i) => setState(() => _pickupLocationTypeIndex = i),
          compact: true,
        ),
        const VerticalSpace(AppSpacing.lg),
        AppOutlinedField(
          controller: _pickupLocationController,
          labelText: 'Location',
          leadingIcon: const Icon(Icons.location_on),
          leadingIconColor: CustomAppColors.toggleSelectedGold,
          trailingIcon: Icon(
            Icons.arrow_drop_down,
            color: CustomAppColors.formTextHint,
          ),
          height: 56,
        ),
        const VerticalSpace(AppSpacing.sm),
        GestureDetector(
          onTap: () {},
          child: Text(
            '+ Add a stop',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: CustomAppColors.toggleSelectedGold,
            ),
          ),
        ),
        const VerticalSpace(AppSpacing.lg),
      ],
    );
  }

  Widget _buildDropOffSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('Drop off'),
        const VerticalSpace(AppSpacing.lg),
        AppSegmentedControl(
          labels: const ['Location', 'Airport'],
          selectedIndex: _dropOffLocationTypeIndex,
          onChanged: (i) => setState(() => _dropOffLocationTypeIndex = i),
          compact: true,
        ),
        const VerticalSpace(AppSpacing.lg),
        AppOutlinedField(
          controller: _dropOffLocationController,
          labelText: 'Location',
          leadingIcon: const Icon(Icons.location_on),
          leadingIconColor: CustomAppColors.toggleSelectedGold,
          trailingIcon: Icon(
            Icons.arrow_drop_down,
            color: CustomAppColors.formTextHint,
          ),
          height: 56,
        ),
      ],
    );
  }

  Widget _buildContactSection(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('Contact Information'),
        const VerticalSpace(AppSpacing.lg),
        AppOutlinedField(
          controller: _phoneController,
          validator: ValidatorUtil.instance.validatePhone,
          leadingIcon: Image.asset(
            'assets/icons/united-states.png',
            width: 8,
            height: 8,
          ),
        ),
        const VerticalSpace(AppSpacing.sm),
        Text(
          "We don't have that phone number on file. Please provide additional contact information.",
          style: theme.textTheme.bodySmall?.copyWith(
            color: CustomAppColors.formTextHint,
          ),
        ),
        const VerticalSpace(AppSpacing.lg),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AppOutlinedField(
                controller: _firstNameController,
                labelText: 'First name',
                leadingIcon: Icon(Icons.person, color: CustomAppColors.primary),
                validator: ValidatorUtil.instance.validateFirstName,
                height: 56,
              ),
            ),
            const HorizontalSpace(AppSpacing.lg),
            Expanded(
              child: AppOutlinedField(
                controller: _lastNameController,
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
          controller: _emailController,
          labelText: 'name@example.com',
          leadingIcon: Icon(Icons.mail, color: CustomAppColors.primary),
          keyboardType: TextInputType.emailAddress,
          validator: ValidatorUtil.instance.validateEmail,
          height: 56,
        ),
      ],
    );
  }

  Widget _buildPassengersSection(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How many passengers are expected for the trip?',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: CustomAppColors.primary,
          ),
        ),
        const VerticalSpace(AppSpacing.md),
        SizedBox(
          width: 150,
          child: AppOutlinedField(
            controller: _passengersController,
            labelText: 'Passengers',
            leadingIcon: Icon(Icons.numbers, color: CustomAppColors.primary),
            validator: ValidatorUtil.instance.validatePassengers,
            height: 56,
          ),
        ),
      ],
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Form is valid!')));
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomAppColors.toggleSelectedGold,
          foregroundColor: CustomAppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text('Continue'),
      ),
    );
  }
}
