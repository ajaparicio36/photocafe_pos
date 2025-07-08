// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'capture_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CaptureState {

 ImageModel? get image; String? get framePath; bool get hasRetake; bool get isLoading; String? get error;
/// Create a copy of CaptureState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CaptureStateCopyWith<CaptureState> get copyWith => _$CaptureStateCopyWithImpl<CaptureState>(this as CaptureState, _$identity);

  /// Serializes this CaptureState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CaptureState&&(identical(other.image, image) || other.image == image)&&(identical(other.framePath, framePath) || other.framePath == framePath)&&(identical(other.hasRetake, hasRetake) || other.hasRetake == hasRetake)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,image,framePath,hasRetake,isLoading,error);

@override
String toString() {
  return 'CaptureState(image: $image, framePath: $framePath, hasRetake: $hasRetake, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $CaptureStateCopyWith<$Res>  {
  factory $CaptureStateCopyWith(CaptureState value, $Res Function(CaptureState) _then) = _$CaptureStateCopyWithImpl;
@useResult
$Res call({
 ImageModel? image, String? framePath, bool hasRetake, bool isLoading, String? error
});


$ImageModelCopyWith<$Res>? get image;

}
/// @nodoc
class _$CaptureStateCopyWithImpl<$Res>
    implements $CaptureStateCopyWith<$Res> {
  _$CaptureStateCopyWithImpl(this._self, this._then);

  final CaptureState _self;
  final $Res Function(CaptureState) _then;

/// Create a copy of CaptureState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? image = freezed,Object? framePath = freezed,Object? hasRetake = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as ImageModel?,framePath: freezed == framePath ? _self.framePath : framePath // ignore: cast_nullable_to_non_nullable
as String?,hasRetake: null == hasRetake ? _self.hasRetake : hasRetake // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CaptureState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageModelCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $ImageModelCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}


/// Adds pattern-matching-related methods to [CaptureState].
extension CaptureStatePatterns on CaptureState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CaptureState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CaptureState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CaptureState value)  $default,){
final _that = this;
switch (_that) {
case _CaptureState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CaptureState value)?  $default,){
final _that = this;
switch (_that) {
case _CaptureState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ImageModel? image,  String? framePath,  bool hasRetake,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CaptureState() when $default != null:
return $default(_that.image,_that.framePath,_that.hasRetake,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ImageModel? image,  String? framePath,  bool hasRetake,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _CaptureState():
return $default(_that.image,_that.framePath,_that.hasRetake,_that.isLoading,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ImageModel? image,  String? framePath,  bool hasRetake,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _CaptureState() when $default != null:
return $default(_that.image,_that.framePath,_that.hasRetake,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CaptureState implements CaptureState {
  const _CaptureState({this.image, this.framePath, this.hasRetake = false, this.isLoading = false, this.error});
  factory _CaptureState.fromJson(Map<String, dynamic> json) => _$CaptureStateFromJson(json);

@override final  ImageModel? image;
@override final  String? framePath;
@override@JsonKey() final  bool hasRetake;
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of CaptureState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CaptureStateCopyWith<_CaptureState> get copyWith => __$CaptureStateCopyWithImpl<_CaptureState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CaptureStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CaptureState&&(identical(other.image, image) || other.image == image)&&(identical(other.framePath, framePath) || other.framePath == framePath)&&(identical(other.hasRetake, hasRetake) || other.hasRetake == hasRetake)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,image,framePath,hasRetake,isLoading,error);

@override
String toString() {
  return 'CaptureState(image: $image, framePath: $framePath, hasRetake: $hasRetake, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$CaptureStateCopyWith<$Res> implements $CaptureStateCopyWith<$Res> {
  factory _$CaptureStateCopyWith(_CaptureState value, $Res Function(_CaptureState) _then) = __$CaptureStateCopyWithImpl;
@override @useResult
$Res call({
 ImageModel? image, String? framePath, bool hasRetake, bool isLoading, String? error
});


@override $ImageModelCopyWith<$Res>? get image;

}
/// @nodoc
class __$CaptureStateCopyWithImpl<$Res>
    implements _$CaptureStateCopyWith<$Res> {
  __$CaptureStateCopyWithImpl(this._self, this._then);

  final _CaptureState _self;
  final $Res Function(_CaptureState) _then;

/// Create a copy of CaptureState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? image = freezed,Object? framePath = freezed,Object? hasRetake = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_CaptureState(
image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as ImageModel?,framePath: freezed == framePath ? _self.framePath : framePath // ignore: cast_nullable_to_non_nullable
as String?,hasRetake: null == hasRetake ? _self.hasRetake : hasRetake // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CaptureState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageModelCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $ImageModelCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}

// dart format on
