import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skuterlar_shop/src/feature/shopping_cart/view/pages/cart_page.dart';

import '../../../../data/entity/cart_model.dart';
import 'empty_cart_page.dart';

class ShoppingCart extends ConsumerWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return cartModels.isEmpty ? const EmptyCartPage() : const Cartpage();
  }
}
