// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'printer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrinterState {

 List<Printer> get connectedPrinters; bool get isLoading; String? get error;
/// Create a copy of PrinterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrinterStateCopyWith<PrinterState> get copyWith => _$PrinterStateCopyWithImpl<PrinterState>(this as PrinterState, _$identity);

  /// Serializes this PrinterState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrinterState&&const DeepCollectionEquality().equals(other.connectedPrinters, connectedPrinters)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(connectedPrinters),isLoading,error);

@override
String toString() {
  return 'PrinterState(connectedPrinters: $connectedPrinters, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $PrinterStateCopyWith<$Res>  {
  factory $PrinterStateCopyWith(PrinterState value, $Res Function(PrinterState) _then) = _$PrinterStateCopyWithImpl;
@useResult
$Res call({
 List<Printer> connectedPrinters, bool isLoading, String? error
});




}
/// @nodoc
class _$PrinterStateCopyWithImpl<$Res>
    implements $PrinterStateCopyWith<$Res> {
  _$PrinterStateCopyWithImpl(this._self, this._then);

  final PrinterState _self;
  final $Res Function(PrinterState) _then;

/// Create a copy of PrinterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? connectedPrinters = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
connectedPrinters: null == connectedPrinters ? _self.connectedPrinters : connectedPrinters // ignore: cast_nullable_to_non_nullable
as List<Printer>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PrinterState].
extension PrinterStatePatterns on PrinterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrinterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrinterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrinterState value)  $default,){
final _that = this;
switch (_that) {
case _PrinterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrinterState value)?  $default,){
final _that = this;
switch (_that) {
case _PrinterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Printer> connectedPrinters,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrinterState() when $default != null:
return $default(_that.connectedPrinters,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Printer> connectedPrinters,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _PrinterState():
return $default(_that.connectedPrinters,_that.isLoading,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Printer> connectedPrinters,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _PrinterState() when $default != null:
return $default(_that.connectedPrinters,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrinterState implements PrinterState {
  const _PrinterState({final  List<Printer> connectedPrinters = const [], this.isLoading = false, this.error}): _connectedPrinters = connectedPrinters;
  factory _PrinterState.fromJson(Map<String, dynamic> json) => _$PrinterStateFromJson(json);

 final  List<Printer> _connectedPrinters;
@override@JsonKey() List<Printer> get connectedPrinters {
  if (_connectedPrinters is EqualUnmodifiableListView) return _connectedPrinters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_connectedPrinters);
}

@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of PrinterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrinterStateCopyWith<_PrinterState> get copyWith => __$PrinterStateCopyWithImpl<_PrinterState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrinterStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrinterState&&const DeepCollectionEquality().equals(other._connectedPrinters, _connectedPrinters)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_connectedPrinters),isLoading,error);

@override
String toString() {
  return 'PrinterState(connectedPrinters: $connectedPrinters, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PrinterStateCopyWith<$Res> implements $PrinterStateCopyWith<$Res> {
  factory _$PrinterStateCopyWith(_PrinterState value, $Res Function(_PrinterState) _then) = __$PrinterStateCopyWithImpl;
@override @useResult
$Res call({
 List<Printer> connectedPrinters, bool isLoading, String? error
});




}
/// @nodoc
class __$PrinterStateCopyWithImpl<$Res>
    implements _$PrinterStateCopyWith<$Res> {
  __$PrinterStateCopyWithImpl(this._self, this._then);

  final _PrinterState _self;
  final $Res Function(_PrinterState) _then;

/// Create a copy of PrinterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? connectedPrinters = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_PrinterState(
connectedPrinters: null == connectedPrinters ? _self._connectedPrinters : connectedPrinters // ignore: cast_nullable_to_non_nullable
as List<Printer>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
