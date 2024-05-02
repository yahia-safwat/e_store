import 'package:flutter/material.dart';
import '../../../../data/models/product_model.dart';

import '../../../../core/constants/constants.dart';
import '../../../../config/size_config.dart';

class ProductImages extends StatefulWidget {
  final String? tag;
  const ProductImages({
    Key? key,
    required this.product,
    this.tag = '',
  }) : super(key: key);

  final Product product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            // child: Image.network(widget.product.images[selectedImage]),
            child: Hero(
              tag: widget.tag ?? widget.product.id,
              child: Image.network(widget.product.images[selectedImage]),
            ),
          ),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.product.images.length,
                (index) => buildSmallProductPreview(index)),
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      // child: AnimatedContainer(
      //   duration: Duration(milliseconds: 500),
      child: Container(
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.network(
          widget.product.images[index],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
