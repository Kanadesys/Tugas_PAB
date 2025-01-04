import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, dynamic>> cartItems = [
    {
      'brand': 'Skintific',
      'name': 'Acne Facial Wash Saliclyid Acid',
      'price': 129000,
      'discountedPrice': 99000,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8ov0PyDbBxYoYcHinAd2J_37zfwmXib4KdA&s',
      'quantity': 1,
    },
    {
      'brand': 'SK II',
      'name': 'Facial Treatment Essence',
      'price': 2575000,
      'discountedPrice': 1500000,
      'imageUrl': 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBw0NEhUNDg0NDQ4NDRANDQ0PDg8PDQ0NFRIWFhURFhUYHSosGBsmGxMTITEtJSorOi4wFx8zOD8tNygvLisBCgoKDg0OFw8QFi0dHR0rKy0tKystLSsvKzEtKzctKystLS0uLS0vKy0tLS0tLSstLSstKysrLS0tLS02Ky0wLf/AABEIAQIAwwMBEQACEQEDEQH/xAAcAAEAAQUBAQAAAAAAAAAAAAAABQECBAYHCAP/xABLEAACAQMABAgJBwkGBwAAAAAAAQIDBBEFEiExBxM1QWFxc7MGFCIyUYGRwdE0VHSSobTDFiRCcnWTsbLhFRdDUpTwI0RidoKi0v/EABoBAQADAQEBAAAAAAAAAAAAAAABAgMEBgX/xAAzEQEAAgEBBQcDAwMFAQAAAAAAAQIRAwQSMUFxEyEyM1FSkTSx0RRhoRUiwUJzgeHwBf/aAAwDAQACEQMRAD8A7UAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEL4Z3lW2sq9ejN06tOmnCaSbi3OKzt62VtOIb7NSL6ta2jMS41Lw60x8+qfUpf/Jlv29X2v0eh7Pv+WNW4QdNR3X0/qU/gN6fVH6TQ9n3/ACxXwlac+ey+pD4Eb1vVH6TR9kfz+VP7y9OfPZfUh8Bv29UfpdH2R/P5U/vM0589f7un8Bv29UfpdH2R/P5dN4NNNaWr1LinfzlX4nioaq4lKjUlBT2vZnyZLdk1rvc3zNptozjsox8/5dBhVlLdBbPTP+hdytY8LfD600RUjQuaNeU6lLjYuioSjq6zjt1mtuUwPp4J+HFrpdzjbUq0XRUHPjlGHn62MYb/AMrA2OdWa/wnLojOGf8A2aAwtCact75TdFzzQrToVYzjqyhUhOUJLnT2xe5gSYAAAAAAAAAAAAAAGu8IXJ1z2Ue8gVv4ZdOx+fVwGZzvQMG5JgRrEqStIQpIK24PQXB2vznSH0m2+6Uzqecb5Q5+sDifD38rofQvxZgZfAH591+rbfjAdmA0bgx33v7UvPvVUDeQAAAAAAAAAAAAAANd4QuTrnso95Arfwy6dj8+rgMjnegYNyTAjZCVZUIQtmSpZ6D4O/lOkPpNt90pnS843ujz9YHFOHv5XQ+hfizAzOAPzrrqtvxgOyAaPwZb739qXn3qsBvAAAAAAAAAAAAAAAGu8IfJ1z2Ue8gVv4ZdOx+fVwGRzvQsK6JhCNkFZUCFkwrbg9CcHnynSH0m2+6Ujpebb1R5+sDinD38rofQvxZgZvAH5111W34wHYwNI4M997+1Lz71WA3cAAAAAAAAAAAAAADXeEPk657KPeQK38MunY/Po4FIwehYV0IEZIlWVArhbMhW3B6E4PflOkPpNt9zpHS823mjz9YHFeHv5XQ+hfizAzOAPzrrqtvxgOxgaTwaf87+1Lz71WA3YAAAAAAAAAAAAAADXeEPk657KPeQK38MunY/Po4GzB6Ft2ivAW3u7aF1O4uIyqU3Nxiqeqmm1syug0jTzHF8vW/+hempakVjunHNzu7tow3ZfrRPZ/uy/qV/bDFTT5n7f6Ds/wBz+o39sFzDVeN+xP2pP3mc84fRpff04tPOHovwes/F3UqweKt06U6/PDjI04w8lPcsRRbtJfAmIbHTjX36+/8A6Ylt6VcILwj8DLTSk41byE6s6dPi4ONWpSShlvGINZ2tjekw+ng54JW2itd2UZUuO1OM1qk6udXW1fPbx50tw3pThJ1ruvH9JfVRSdSTDE8E7Glb8cqevmtXncVNZprXqTnOWPR5UmXpfeRMYbCaIAAAAAAAAAAAAAAa7wh8nXPZR7yBW/hl07H59OrgbOd6J1vwRi5WFFJxzxL2Slq5WZ5w3sTy47+k6a8Iea2nzr9Z+7n2nNAQhSdfiNSVPxp1bWdaWvGMbh0oTk8+ZTTi5OO9tbk21LFEPRFvHR3jepm4UfPVSbg349xGUk8eZ9oGv3vnP9WP8qOe3GX39Hya9HpjR3N6ikPiy2CmthtVnKrRMwZUluKyIu8MrLwaD3z6o+8vo80WS50KAAAAAAAAAAAAAANd4Q+Trns495Arfwy6dj8+nVwRnO9G6x4Jr8wo7NvEPGUnh5l6Tprwh5navOv1n7uVaQ03eOaquu3UpqtqScKTwq2eNTTjiSll7Gn0EsUMtKXPFeK8b+b4xxPFUUscZxm/Vz5/lbwMe+85/qx/lRzW4y9BoeTXo9MaP5uorD4iToaYtJKOLiliq4qlJy1Y1m2kuLk9k8trzc7zekwTpX7/AO3h/HV9rbSNvWc1SrQqOi3GqoPWdOS3xklufQWmYlWaWrjMcVv9o28qTuFWg6MU26uf+Gkt7z6DOU9nbe3cd/oiJ6UtqslCnXpVJzp8bGMZpylSe6aS3x6dxjaYaTpXrGZrMRwZug98+qPvNdHmysljdQAAAAAAAAAAAAABrvCHydc9lHvIFb+GXVsXn06uCSOd6J8K1/cQWrG4rxilhRjWqKKXoST2EqdlSe+ax8Qh5zb52/WJmVZ0tP2x8LMsjMo7Kntj4Um8+wFoiIxD0pO0VxRqW7lqKvQqUXNb468HHW+0q+Dp33Lxb0nPwxVpevbKja6ZsoxpKtQjR0hby17Xj4STpSnHfS2xj7XzZNYtjG9Dp7Gt96+z378Tms8cc/2lH/2nO1q3uvTnGynptQvrqM1GVClOhCKxzpa2qpS2YUtm15iziZ9MrTpRaunif7tzuj175/8AQ2/S8mravBUXTpxs66g1KnqaqpSSSUXsWCbcHHpeZWc84+7R/Bz5Tbf9rWnfI5/To+htXlX/AN232bzoPfPqj7zfR5vl2SxuoAAAAAAAAAAAAAA13hC5Oueyj3kCt/DLq2Lz6dXBZHO9EjromEo+REqyoQhZMlS3B6W8VVenKg5zgqtN03ODxOCaxrRfM1zFXn623LRbGcM+80JUuoQoXF1xtvCpTqygqMYVq7pyUoqpNPGMpN6sY5xzG8VzGJTXWjTmbUrie/n3Rn0/7mVbTQlOmrlTqwrQ0jVnUqwnBailKCg4pJ7Y4ju6HtLbuM/ui2vM7mIxucPuWWhpUbN2HjU6seJlbwrThF1YUmnHDw8PC2Lq25M8YjCba0W1e03cd+cIe18H1a1IVlWlPibCno6MXBJOhCWtGTafnZ9XQYzGGuptM3pNZjjbe/5n/Cd0Hvn1R95ro83LZLHQoAAAAAAAAAAAAAA13hC5Oueyj3kCt/DLq2Lz6dXBZHO9IjrsmEI9kSrKgQtmFb8HpzR/N6iIeclM16lSMc0+L3fpvC1nKKSznpf2G9Gco90035MKCyspqq/Kw5qKwpbnl7fS5F0Lrebi/JjRjxko7FW1sxlKTbW3a8vPNnLKWSpc5x5WNbC1sbs85z2XX6D3z6o+800eaLJc6FAAAAAAAAAAAAAAGu8IXJ1z2Ue8gVv4ZdWxefTq4LI5npGBcloEbIrMqyoMoWzCluD05o/evURDzkp9U4yjiSytjx0p5T9qR0UZys8Spb+LjlbU/Q85/iy8oWu0pJbIRWHrLGxKWc569pnMrMC8MZWXaD3z6o+800eaLJc3UAAAAAAAAAAAAAAa7whcnXPZR7yBW/hl1bF59OrgsjmelYNyTCUbIrLOeK0hC2ZZW3B6csOb1EQ83LYaW46KM5XlrIfOe4zlZFXhjZZdoPfPqj7zXR5oslzdQAAAAAAAAAAAAABrvCFydc9lHvIFb+GXVsP1FOrgsjmemYNyTAjZESpKhVGFsyYUtwem9H83qEPNy2GluOijOV5ayHznuM5WRN4Y2WX6D3z6o+800eaLJc6FAAAAAAAAAAAAAAGu8IXJ1z2Ue8gVv4Zdew/UU6uDM5npmDdEwI2REqStIQtmFLcHpvR/MIealsNPcdFGcry0ofOe4zlaEVeGVloXaD3z6o+8vo80WS50KAAAAAAAAAAAAAANd4QuTrnso95Apfwy69h+op1cGZzvTsG8JEayJUlQhVbMK24PTWj+b1CHmZbDS3HRRnK8tZD5z3GcrIq8MrLLtB759UfeX0eaLJc6FAAAAAAAAAAAAAAGvcIPJ1z2Ue8gVv4Zdew/UU6uDM5np0fekwlHMqpKgVWzCluD0zo/m9Qh5lsVLcdFGcry1kPnPcZysibwystC/QW+fVH3l9HmiyXOhQAAAAAAAAAAAAABr3CDydc9lHvIFL+GXXsP1FOrhEIptJtRTaTk90U3vZzPTy+dxYQm8K4pZcW0sTbzhPVxjOc55sbM5LM51Jj/AEsFaMbTbnqyjreS6c9uNbc//Fe0rhnOt38FtXR0I768VtaWYTi2lzrPNu9ox+6saszwqwbqnGLxGans3pbM5a/31kLTMzGZjD0ro/m9RMPNSm/GYw8l53J7NXneFsznf0G9ZwpMLpXaX6MsZSzmCWWsr9L0FplGFnjUJeTuz6XH/Lrcz9BnMrYR9zJSWVzmUpfTQW+fVH3mujzRZLm6gAAAAAAAAAAAAADXuEHk657KPeQKX8MuvYfqKdXB2cz1CPuqjg9aLae1ZXoaaf2NlkTETGJY87+u/wDFqb8rynlP0r2sr3suzp6PjVrTn58nLGcZ6d5CYrFeD4zCt+D01o9bvUTDy6epRWN29YfStvxZ0UUlWVGL2aq3p+tLC+wtaCFkqUcbt2cbXndj+BnKUddx39O/2Y9yMrLLtCLbPqj7zTR5osljdQAAAAAAAAAAAAABr3CBydc9lHvIlL+GXXsP1FOrgrZzPUIy9e0tCWGyqkqEKrJhS709YLd1ItDy6dpbjeikrmWshZIzlZH3UTOVjQ62z6o+8vo81bJQ3VAAAAAAAAAAAAAAa/wgcnXPYr+eJW/hl17D9RTq4DKRzPUI252ssTwYziUUU1WQhbOLClnpy1lqpdS/gXiHl5SVK7iawq+ju4kzKMLXdxISxa9ZMzmEvponfLqj7y+lHFFkkbKgAAAAAAAAAAAAAMTS1CFWjOnUhGpCcdWUJJSjJZWxpkTwX05xeJhqL8F9H/MLT9xT+BTEO/t9T3T8vnLwY0f8xtP3FP4Ddj0R2+p7p+Vv5MaP+Y2n+np/Ajdr6Hbanun5PyZ0f8xtP3FP4E7tfQ7a/un5U/JnR/zG0/09P4Ddj0O2v7p+WxUKGxL0JJdRG7Dgme99lb9LJwjK7iekYMqqj0jBlZKiRumWVoxNay/Vx9pesYJZxZAAAAAAAAAAAAAACytHMWvSgmvdLDdqVw23ljtOgYN5TxPoGDeU8T6Bg3jxPoGDeZlOhsGGMvpxSGEKcShgVVJDAo6KGBWlT1c9OCYTL6EoAAAAAAAAAAAAAAAKYAYAYQDADCAqAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAH/9k=',
      'quantity': 1,
    },
    {
      'brand': 'Charlotte Tilbury',
      'name': 'Compact Flawless Powder',
      'price': 860000,
      'discountedPrice': 500000,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHYRmjuXWcc9qO9eil9dJx6ZI1FV2HesHXmA&s',
      'quantity': 1,

    }
    
  ];

  int calculateSubtotal() {
  return cartItems.fold(0, (sum, item) {
    return sum + (item['discountedPrice'] as int) * (item['quantity'] as int);
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Bag'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            item['imageUrl'],
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),

                        // Product Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['brand'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item['name'],
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 4),
                              // Text(
                              //   'Shade: ${item['shade']}',
                              //   style: const TextStyle(color: Colors.grey),
                              // ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    'Rp ${item['price']}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Rp ${item['discountedPrice']}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Quantity and Actions
                        Column(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  cartItems.removeAt(index);
                                });
                              },
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      if (item['quantity'] > 1) {
                                        item['quantity']--;
                                      }
                                    });
                                  },
                                ),
                                Text('${item['quantity']}'),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      item['quantity']++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Rewards and Checkout Section
          Container(
            color: Colors.grey[100],
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Redeem Rewards Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Redeem Your Rewards'),
                    ElevatedButton(
                      onPressed: () {
                        // Handle redeem action
                      },
                      child: const Text('REDEEM NOW'),
                    ),
                  ],
                ),
                const Divider(height: 32),

                // Subtotal
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Subtotal', style: TextStyle(fontSize: 16)),
                    Text(
                      'Rp ${calculateSubtotal()}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Checkout Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle checkout action
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Proceeding to checkout!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      'CHECKOUT',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}