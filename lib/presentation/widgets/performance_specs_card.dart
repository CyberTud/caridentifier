import 'package:flutter/material.dart';
import '../../domain/entities/performance_specs.dart';

class PerformanceSpecsCard extends StatelessWidget {
  final PerformanceSpecs performanceSpecs;

  const PerformanceSpecsCard({
    super.key,
    required this.performanceSpecs,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title with icon
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.speed_rounded,
                  size: 24,
                  color: Colors.red,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Performance',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Performance grid
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: MediaQuery.of(context).size.width > 600 ? 1.2 : 1.5,
            children: [
              _buildPerformanceItem(
                context,
                Icons.local_fire_department_rounded,
                'Power',
                performanceSpecs.horsepower,
                Colors.orange,
              ),
              _buildPerformanceItem(
                context,
                Icons.rotate_right_rounded,
                'Torque',
                performanceSpecs.torque,
                Colors.purple,
              ),
              _buildPerformanceItem(
                context,
                Icons.timer_rounded,
                '0-60 mph',
                performanceSpecs.zeroToSixty,
                Colors.blue,
              ),
              _buildPerformanceItem(
                context,
                Icons.trending_up_rounded,
                'Top Speed',
                performanceSpecs.topSpeed,
                Colors.green,
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Fuel economy
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.surface.withOpacity(0.7),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: colorScheme.outline.withOpacity(0.2),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.teal.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.local_gas_station_rounded,
                    color: Colors.teal,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fuel Economy',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withOpacity(0.6),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        performanceSpecs.fuelEconomy,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: colorScheme.onSurface.withOpacity(0.9),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceItem(
    BuildContext context,
    IconData icon,
    String label,
    String value,
    Color iconColor,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: iconColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: iconColor.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 18,
                color: iconColor,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurface.withOpacity(0.6),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: theme.textTheme.titleSmall?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}