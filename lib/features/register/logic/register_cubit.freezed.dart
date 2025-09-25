// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterState {

 List<BranchEntity> get branch; List<TreatmentEntity> get treatment;
/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterStateCopyWith<RegisterState> get copyWith => _$RegisterStateCopyWithImpl<RegisterState>(this as RegisterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterState&&const DeepCollectionEquality().equals(other.branch, branch)&&const DeepCollectionEquality().equals(other.treatment, treatment));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(branch),const DeepCollectionEquality().hash(treatment));

@override
String toString() {
  return 'RegisterState(branch: $branch, treatment: $treatment)';
}


}

/// @nodoc
abstract mixin class $RegisterStateCopyWith<$Res>  {
  factory $RegisterStateCopyWith(RegisterState value, $Res Function(RegisterState) _then) = _$RegisterStateCopyWithImpl;
@useResult
$Res call({
 List<BranchEntity> branch, List<TreatmentEntity> treatment
});




}
/// @nodoc
class _$RegisterStateCopyWithImpl<$Res>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._self, this._then);

  final RegisterState _self;
  final $Res Function(RegisterState) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? branch = null,Object? treatment = null,}) {
  return _then(_self.copyWith(
branch: null == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as List<BranchEntity>,treatment: null == treatment ? _self.treatment : treatment // ignore: cast_nullable_to_non_nullable
as List<TreatmentEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterState].
extension RegisterStatePatterns on RegisterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<BranchEntity> branch,  List<TreatmentEntity> treatment)?  initial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.branch,_that.treatment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<BranchEntity> branch,  List<TreatmentEntity> treatment)  initial,}) {final _that = this;
switch (_that) {
case Initial():
return initial(_that.branch,_that.treatment);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<BranchEntity> branch,  List<TreatmentEntity> treatment)?  initial,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.branch,_that.treatment);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements RegisterState {
  const Initial({required final  List<BranchEntity> branch, required final  List<TreatmentEntity> treatment}): _branch = branch,_treatment = treatment;
  

 final  List<BranchEntity> _branch;
@override List<BranchEntity> get branch {
  if (_branch is EqualUnmodifiableListView) return _branch;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_branch);
}

 final  List<TreatmentEntity> _treatment;
@override List<TreatmentEntity> get treatment {
  if (_treatment is EqualUnmodifiableListView) return _treatment;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_treatment);
}


/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitialCopyWith<Initial> get copyWith => _$InitialCopyWithImpl<Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial&&const DeepCollectionEquality().equals(other._branch, _branch)&&const DeepCollectionEquality().equals(other._treatment, _treatment));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_branch),const DeepCollectionEquality().hash(_treatment));

@override
String toString() {
  return 'RegisterState.initial(branch: $branch, treatment: $treatment)';
}


}

/// @nodoc
abstract mixin class $InitialCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) _then) = _$InitialCopyWithImpl;
@override @useResult
$Res call({
 List<BranchEntity> branch, List<TreatmentEntity> treatment
});




}
/// @nodoc
class _$InitialCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(this._self, this._then);

  final Initial _self;
  final $Res Function(Initial) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? branch = null,Object? treatment = null,}) {
  return _then(Initial(
branch: null == branch ? _self._branch : branch // ignore: cast_nullable_to_non_nullable
as List<BranchEntity>,treatment: null == treatment ? _self._treatment : treatment // ignore: cast_nullable_to_non_nullable
as List<TreatmentEntity>,
  ));
}


}

// dart format on
