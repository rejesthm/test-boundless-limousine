import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_repo_example/blocs/location_bloc/location_bloc.dart';
import 'package:test_repo_example/common/models/place_prediction/place_prediction.dart';
import 'package:test_repo_example/blocs/trip_bloc/trip_bloc.dart';
import 'package:test_repo_example/common/styles/app_colors.dart';
import 'package:test_repo_example/common/styles/app_spacing.dart';
import 'package:test_repo_example/common/utils/date_time_utils.dart';
import 'package:test_repo_example/common/utils/validator_utils.dart';
import 'package:test_repo_example/common/widgets/app_outlined_field.dart';
import 'package:test_repo_example/common/widgets/app_segmented_control.dart';
import 'package:test_repo_example/dependencies/dependency_manager.dart';
import 'package:test_repo_example/repositories/phone_contacts_repository.dart';
import 'package:test_repo_example/common/models/phone_contact/phone_contact.dart';
import 'package:test_repo_example/screens/home/contact_information_section.dart';
import 'package:test_repo_example/screens/home/personal_information_section.dart';
import 'package:test_repo_example/common/widgets/greeting_bottomsheet.dart';
import 'package:test_repo_example/screens/home/pickup_and_dropoff_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _showPersonalInfo = false;
  int _tripTypeIndex = 0;
  int _pickupLocationTypeIndex = 0;
  int _dropOffLocationTypeIndex = 0;

  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _pickupLocationController = TextEditingController();
  final _dropOffLocationController = TextEditingController();
  final _phoneController = TextEditingController();
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
                PickupAndDropoffWidget(
                  dateController: _dateController,
                  timeController: _timeController,
                  pickupLocationController: _pickupLocationController,
                  dropOffLocationController: _dropOffLocationController,
                  pickupLocationTypeIndex: _pickupLocationTypeIndex,
                  dropOffLocationTypeIndex: _dropOffLocationTypeIndex,
                  onPickupLocationTypeChanged: (i) =>
                      setState(() => _pickupLocationTypeIndex = i),
                  onDropOffLocationTypeChanged: (i) =>
                      setState(() => _dropOffLocationTypeIndex = i),
                  onDateTap: () => _pickDate(context),
                  onTimeTap: () => _pickTime(context),
                ),
                const VerticalSpace(AppSpacing.xl),
                ContactInformationWidget(phoneController: _phoneController),
                if (_showPersonalInfo) ...[
                  Text(
                    'We don\'t have that phone number on file. Please provide your contact information.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: CustomAppColors.formTextSecondary,
                    ),
                  ),
                  const VerticalSpace(AppSpacing.lg),
                  PersonalInformationWidget(
                    firstNameController: _firstNameController,
                    lastNameController: _lastNameController,
                    emailController: _emailController,
                  ),
                  const VerticalSpace(AppSpacing.lg),
                ],
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

  Future<void> _pickDate(BuildContext context) async {
    final initial =
        DateTimeUtils.tryParseDate(_dateController.text) ?? DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: CustomAppColors.toggleSelectedGold,
            onPrimary: CustomAppColors.white,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null && mounted) {
      _dateController.text = DateTimeUtils.formatDate(picked);
    }
  }

  Future<void> _pickTime(BuildContext context) async {
    final parsed = DateTimeUtils.tryParseTime(_timeController.text);
    final initial = parsed != null
        ? TimeOfDay(hour: parsed.$1, minute: parsed.$2)
        : const TimeOfDay(hour: 0, minute: 0);
    final picked = await showTimePicker(
      context: context,
      initialTime: initial,
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: CustomAppColors.toggleSelectedGold,
            onPrimary: CustomAppColors.white,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null && mounted) {
      _timeController.text = DateTimeUtils.formatTime(
        picked.hour,
        picked.minute,
      );
    }
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

  Widget _buildPassengersSection(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How many passengers are expected for the trip?',
          style: theme.textTheme.bodyMedium,
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
            keyboardType: TextInputType.numberWithOptions(decimal: false),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
      ],
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return BlocConsumer<TripBloc, TripState>(
      listener: (context, state) {
        if (state.isSuccess) {
          if (state.recognizedFirstName != null) {
            showGreetingBottomsheet(context, state.recognizedFirstName!);
          } else if (state.needsContactInfo) {
            if (mounted) {
              setState(() {
                _showPersonalInfo = true;
                _firstNameController.clear();
                _lastNameController.clear();
                _emailController.clear();
              });
            }
          }
        }
        if (state.isFailure && state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: state.isLoading
                ? null
                : () {
                    if (!_formKey.currentState!.validate()) return;
                    if (_showPersonalInfo) {
                      _saveContactAndComplete(context);
                    } else {
                      _firstNameController.clear();
                      _lastNameController.clear();
                      _emailController.clear();
                      _submitTrip(context);
                    }
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomAppColors.toggleSelectedGold,
              foregroundColor: CustomAppColors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: state.isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: CustomAppColors.white,
                    ),
                  )
                : const Text('Continue'),
          ),
        );
      },
    );
  }

  Future<void> _saveContactAndComplete(BuildContext context) async {
    final contact = PhoneContact(
      number: _phoneController.text,
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      email: _emailController.text.trim(),
    );
    await sl<PhoneContactsRepository>().saveContact(contact);
    if (!mounted) return;
    setState(() {
      _showPersonalInfo = false;
      _firstNameController.clear();
      _lastNameController.clear();
      _emailController.clear();
    });
    context.read<TripBloc>().add(const TripContactInfoSaved());
    showGreetingBottomsheet(context, contact.firstName);
  }

  void _submitTrip(BuildContext context) {
    final locationState = context.read<LocationBloc>().state;
    final payload = <String, dynamic>{
      'pickup':
          locationState.pickupPlace?.description ??
          _pickupLocationController.text,
      'dropoff':
          locationState.dropoffPlace?.description ??
          _dropOffLocationController.text,
      'stops': locationState.stopPlaces
          .whereType<PlacePrediction>()
          .map((p) => p.description)
          .toList(),
      'date': _dateController.text,
      'time': _timeController.text,
      'phone': _phoneController.text,
      'firstName': _firstNameController.text,
      'lastName': _lastNameController.text,
      'email': _emailController.text,
      'passengers': _passengersController.text,
      'tripType': _tripTypeIndex == 0 ? 'one-way' : 'hourly',
    };
    context.read<TripBloc>().add(TripSubmit(payload: payload));
  }
}
