// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stopwatch_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StopwatchNotifier)
const stopwatchProvider = StopwatchNotifierProvider._();

final class StopwatchNotifierProvider
    extends $NotifierProvider<StopwatchNotifier, int> {
  const StopwatchNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stopwatchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stopwatchNotifierHash();

  @$internal
  @override
  StopwatchNotifier create() => StopwatchNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$stopwatchNotifierHash() => r'96374031875cf821ad7b3e787f51172ab8feeaaf';

abstract class _$StopwatchNotifier extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
