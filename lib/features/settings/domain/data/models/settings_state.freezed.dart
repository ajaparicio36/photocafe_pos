// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingsState {

 String? get selectedPrinter; String? get selectedPrinterAddress; String get cameraOrientation;
/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsStateCopyWith<SettingsState> get copyWith => _$SettingsStateCopyWithImpl<SettingsState>(this as SettingsState, _$identity);

  /// Serializes this SettingsState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsState&&(identical(other.selectedPrinter, selectedPrinter) || other.selectedPrinter == selectedPrinter)&&(identical(other.selectedPrinterAddress, selectedPrinterAddress) || other.selectedPrinterAddress == selectedPrinterAddress)&&(identical(other.cameraOrientation, cameraOrientation) || other.cameraOrientation == cameraOrientation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,selectedPrinter,selectedPrinterAddress,cameraOrientation);

@override
String toString() {
  return 'SettingsState(selectedPrinter: $selectedPrinter, selectedPrinterAddress: $selectedPrinterAddress, cameraOrientation: $cameraOrientation)';
}


}

/// @nodoc
abstract mixin class $SettingsStateCopyWith<$Res>  {
  factory $SettingsStateCopyWith(SettingsState value, $Res Function(SettingsState) _then) = _$SettingsStateCopyWithImpl;
@useResult
$Res call({
 String? selectedPrinter, String? selectedPrinterAddress, String cameraOrientation
});




}
/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._self, this._then);

  final SettingsState _self;
  final $Res Function(SettingsState) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedPrinter = freezed,Object? selectedPrinterAddress = freezed,Object? cameraOrientation = null,}) {
  return _then(_self.copyWith(
selectedPrinter: freezed == selectedPrinter ? _self.selectedPrinter : selectedPrinter // ignore: cast_nullable_to_non_nullable
as String?,selectedPrinterAddress: freezed == selectedPrinterAddress ? _self.selectedPrinterAddress : selectedPrinterAddress // ignore: cast_nullable_to_non_nullable
as String?,cameraOrientation: null == cameraOrientation ? _self.cameraOrientation : cameraOrientation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SettingsState].
extension SettingsStatePatterns on SettingsState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettingsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettingsState value)  $default,){
final _that = this;
switch (_that) {
case _SettingsState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettingsState value)?  $default,){
final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? selectedPrinter,  String? selectedPrinterAddress,  String cameraOrientation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
return $default(_that.selectedPrinter,_that.selectedPrinterAddress,_that.cameraOrientation);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? selectedPrinter,  String? selectedPrinterAddress,  String cameraOrientation)  $default,) {final _that = this;
switch (_that) {
case _SettingsState():
return $default(_that.selectedPrinter,_that.selectedPrinterAddress,_that.cameraOrientation);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? selectedPrinter,  String? selectedPrinterAddress,  String cameraOrientation)?  $default,) {final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
return $default(_that.selectedPrinter,_that.selectedPrinterAddress,_that.cameraOrientation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SettingsState implements SettingsState {
  const _SettingsState({this.selectedPrinter, this.selectedPrinterAddress, this.cameraOrientation = 'front'});
  factory _SettingsState.fromJson(Map<String, dynamic> json) => _$SettingsStateFromJson(json);

@override final  String? selectedPrinter;
@override final  String? selectedPrinterAddress;
@override@JsonKey() final  String cameraOrientation;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsStateCopyWith<_SettingsState> get copyWith => __$SettingsStateCopyWithImpl<_SettingsState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SettingsStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsState&&(identical(other.selectedPrinter, selectedPrinter) || other.selectedPrinter == selectedPrinter)&&(identical(other.selectedPrinterAddress, selectedPrinterAddress) || other.selectedPrinterAddress == selectedPrinterAddress)&&(identical(other.cameraOrientation, cameraOrientation) || other.cameraOrientation == cameraOrientation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,selectedPrinter,selectedPrinterAddress,cameraOrientation);

@override
String toString() {
  return 'SettingsState(selectedPrinter: $selectedPrinter, selectedPrinterAddress: $selectedPrinterAddress, cameraOrientation: $cameraOrientation)';
}


}

/// @nodoc
abstract mixin class _$SettingsStateCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory _$SettingsStateCopyWith(_SettingsState value, $Res Function(_SettingsState) _then) = __$SettingsStateCopyWithImpl;
@override @useResult
$Res call({
 String? selectedPrinter, String? selectedPrinterAddress, String cameraOrientation
});




}
/// @nodoc
class __$SettingsStateCopyWithImpl<$Res>
    implements _$SettingsStateCopyWith<$Res> {
  __$SettingsStateCopyWithImpl(this._self, this._then);

  final _SettingsState _self;
  final $Res Function(_SettingsState) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedPrinter = freezed,Object? selectedPrinterAddress = freezed,Object? cameraOrientation = null,}) {
  return _then(_SettingsState(
selectedPrinter: freezed == selectedPrinter ? _self.selectedPrinter : selectedPrinter // ignore: cast_nullable_to_non_nullable
as String?,selectedPrinterAddress: freezed == selectedPrinterAddress ? _self.selectedPrinterAddress : selectedPrinterAddress // ignore: cast_nullable_to_non_nullable
as String?,cameraOrientation: null == cameraOrientation ? _self.cameraOrientation : cameraOrientation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
