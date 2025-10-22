import 'package:e_commerce/controllers/product_controller.dart';
import 'package:e_commerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryProducts extends StatefulWidget {
  final String categoryName;



  const CategoryProducts({super.key, required this.categoryName});

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(
      Duration(seconds: 0),
      (){
        context.read<ProductController>().loadProductsByCategory(widget.categoryName);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),

      body: Consumer<ProductController>(
        builder: (_, value ,_){
          if (value.isCategoryLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          
          else if (value.getErrorMessage.isNotEmpty){
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          else if (value.getCategoryProductList.isEmpty){
            return Center(
              child: Text("No Products in this Category"),
            );
          }

          else {
             return Padding(
               padding: const EdgeInsets.all(16),
               child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: value.getCategoryProductList.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: value.getCategoryProductList[index]);
                },
                ),
             );
          }
        },
        ),
    );
  }
}