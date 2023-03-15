import 'package:boring_counter/presentation/counter/model/ui_counter.dart';
import 'package:flutter/material.dart';

class CounterItemWidget extends StatelessWidget {
  const CounterItemWidget({
    required this.counter,
    super.key,
  });

  final UiCounter counter;

  @override
  Widget build(BuildContext context) {
    final captionStyle =
        Theme.of(context).textTheme.bodySmall ?? const TextStyle();
    return _CardWrapper(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          counter.name,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    counter.id,
                    style: captionStyle.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '${counter.count}',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class _CardWrapper extends StatelessWidget {
  const _CardWrapper({
    required this.child,
  });

  static final _cardShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  );

  final Widget child;

  @override
  Widget build(BuildContext context) => Card(
        shape: _cardShape,
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: _cardShape,
          ),
          child: child,
        ),
      );
}
