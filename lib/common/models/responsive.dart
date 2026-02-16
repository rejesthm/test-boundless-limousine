import 'package:freezed_annotation/freezed_annotation.dart';
part 'responsive.freezed.dart';

@freezed
class Responsive with _$Responsive {
  const factory Responsive.isMobile() = IsMobile;
  const factory Responsive.isTablet() = IsTablet;
  const factory Responsive.isDesktop() = IsDesktop;
}
