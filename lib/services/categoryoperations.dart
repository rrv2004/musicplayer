import 'package:newproject/models/category.dart';

class CategoryOperations {
  CategoryOperations._() {} //private constructor which is only accesible here
  static List<Categories> getCategories() {
    return <Categories>[
      Categories('Liked Songs',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhJfBlqnksndE24LQZQfFEI9P5EOWg0E_R_w&usqp=CAU'),
      Categories('Discover Weekly',
          'https://s.cafebazaar.ir/images/icons/com.spotify.zerotap-17b452d3-5f32-4351-ac03-d664e9e3ea0e_512x512.png?x-img=v1/format,type_webp,lossless_false/resize,h_256,w_256,lossless_false/optimize')
    ];
  }
}
