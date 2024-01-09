import 'package:auto_route/auto_route.dart';
import 'package:boring_counter/di/injectable/all.dart';
import 'package:boring_counter/presentation/counter/model/ui_counter.dart';
import 'package:boring_counter/presentation/counter_list/counter_list.dart';
import 'package:boring_counter/presentation/counter_list/view/counter_item_widget.dart';
import 'package:boring_counter/presentation/counter_list/view/multiple_tap_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

@RoutePage()
class CounterListPage extends StatelessWidget {
  const CounterListPage({super.key});

  static const path = 'counters';

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => getIt.get<CounterListCubit>()..watchCounters(),
        child: const CounterListViewWrapper(),
      );
}

class CounterListViewWrapper extends StatelessWidget {
  const CounterListViewWrapper({super.key});

  @override
  Widget build(BuildContext context) => ScreenTypeLayout.builder(
        desktop: (_) => const WidePage(),
        tablet: (_) => const WidePage(),
        mobile: (_) => const NarrowPage(),
      );
}

class WidePage extends StatelessWidget {
  const WidePage({super.key});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 380,
            ),
            child: const CounterListView(),
          ),
          const VerticalDivider(),
          const Flexible(
            child: AutoRouter(),
          )
        ],
      );
}

class NarrowPage extends StatelessWidget {
  const NarrowPage({super.key});

  @override
  Widget build(BuildContext context) => const CounterListView();
}

class CounterListView extends StatelessWidget {
  const CounterListView({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder(
        bloc: context.read<CounterListCubit>(),
        builder: (BuildContext context, CounterListState state) {
          return Scaffold(
            body: MultipleTapGestureWrapper(
              state: state,
              child: state.map(
                loading: (loadingState) => Stack(
                  children: [
                    MaybeCountersWidget(
                      counters: loadingState.counters,
                    ),
                    const LoadingWidget(),
                  ],
                ),
                ready: (readyState) => MaybeCountersWidget(
                  counters: readyState.counters,
                ),
              ),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AddButton(
                  onPressed: () =>
                      context.read<CounterListCubit>().createCounter(
                            name: 'Counter #${state.counters.length}',
                          ),
                ),
              ],
            ),
          );
        },
      );
}

class MultipleTapGestureWrapper extends StatelessWidget {
  const MultipleTapGestureWrapper({
    required this.child,
    required this.state,
    super.key,
  });

  final Widget child;

  final CounterListState state;

  @override
  Widget build(BuildContext context) => RawGestureDetector(
        // TODO(daniel): check if opaque behavior is needed after widget tree is done
        behavior: HitTestBehavior.opaque,
        gestures: {
          MultipleTapGestureRecognizer: MultipleTapGestureRecognizerFactory(
            MultipleTapGestureRecognizer.new,
            (MultipleTapGestureRecognizer instance) => {
              instance.onMultipleTap = (additionalFingersCount) {
                if (state is ReadyState) {
                  context.read<CounterListCubit>().incrementCounter(
                        counterIndex: additionalFingersCount,
                      );
                }
              }
            },
          ),
        },
        child: child,
      );
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  static const double _opacity = 0.64;

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: Theme.of(context).dialogBackgroundColor.withOpacity(_opacity),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
}

class MaybeCountersWidget extends StatelessWidget {
  const MaybeCountersWidget({super.key,
    required this.counters,
  });

  final List<UiCounter> counters;

  @override
  Widget build(BuildContext context) => counters.isEmpty
      ? const _EmptyWidget()
      : _CountersWidget(
          counters: counters,
        );
}

class _CountersWidget extends StatelessWidget {
  const _CountersWidget({
    required this.counters,
  });

  final List<UiCounter> counters;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: counters.length,
        itemBuilder: (context, index) => CounterItemWidget(
          key: ValueKey(counters[index].id),
          counter: counters[index],
        ),
      );
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget();

  // TODO(daniel): Localize
  @override
  Widget build(BuildContext context) {
    final baseTextStyle =
        Theme.of(context).textTheme.bodyLarge ?? const TextStyle();
    return Center(
      child: Text(
        "You don't have any counters.\nFeel free to tap '+' and add one.",
        style: baseTextStyle.copyWith(
          color: Colors.blueGrey,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => FloatingActionButton(
        onPressed: onPressed,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      );
}
