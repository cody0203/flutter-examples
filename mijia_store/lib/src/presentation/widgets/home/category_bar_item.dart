import 'package:flutter/material.dart';

class CategoryBarItem extends StatelessWidget {
  const CategoryBarItem({
    Key? key,
    required this.name,
    this.iconAsset,
    required this.isActive,
    required this.onChoose,
  }) : super(key: key);

  final String name;
  final String? iconAsset;
  final bool isActive;
  final VoidCallback onChoose;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeIn,
      padding: const EdgeInsets.symmetric(
        horizontal: 23,
        vertical: 12,
      ),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: isActive
                ? const Color.fromRGBO(42, 96, 73, 0.2)
                : Theme.of(context).shadowColor,
            offset: isActive
                ? const Offset(
                    0,
                    2.0,
                  )
                : const Offset(
                    0.0,
                    4.0,
                  ),
            blurRadius: isActive ? 2.0 : 10.0,
          ),
        ],
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: <Widget>[
          if (iconAsset != null) ...[
            Image.asset(iconAsset ?? ''),
            const SizedBox(
              width: 7,
            ),
          ],
          Text(
            name,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
