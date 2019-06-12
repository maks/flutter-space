import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

/// A snapping physics that always lands  at the  bottom of the scrollable only
class SnapToEndsPhysics extends ScrollPhysics {
  /// Creates a scroll physics that always lands on top or bottom of scrollable.
  const SnapToEndsPhysics({ScrollPhysics parent}) : super(parent: parent);

  @override
  ScrollPhysics applyTo(ScrollPhysics ancestor) {
    return SnapToEndsPhysics(parent: buildParent(ancestor));
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    print("vel: $velocity pos: $position");

    final target = 0.0;
    var sim = ScrollSpringSimulation(spring, position.pixels, target, 0,
        tolerance: tolerance);
    return sim;
  }
}
