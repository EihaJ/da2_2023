import 'package:flutter/material.dart';

class CategoriesItem extends StatefulWidget {
  final String categoryName;
  final String categoryImage;
  final Function onTap;

  CategoriesItem({
    required this.categoryName,
    required this.categoryImage,
    required this.onTap,
  });

  @override
  _CategoriesItemState createState() => _CategoriesItemState();
}

class _CategoriesItemState extends State<CategoriesItem> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: MouseRegion(
          onHover: (event) {
            setState(() {
              _isHovering = true;
            });
          },
          onExit: (event) {
            setState(() {
              _isHovering = false;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0.5),
            ),
            height: 320,
            child: Stack(
              children: [
                Positioned.fill(
                  child: InkWell(
                    onTap: () {
                      widget.onTap();
                    },
                    child: FittedBox(
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.fitWidth,
                      child: Image.network(widget.categoryImage),
                    ),
                  ),
                ),
                if (!_isHovering == true)
                  Positioned.fill(
                    child: Container(
                      color: Theme.of(context).primaryColor.withOpacity(0.3),
                    ),
                  ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 48,
                    width: 240,
                    decoration: BoxDecoration(
                      color: _isHovering
                          ? Colors.white
                          : Theme.of(context).primaryColor.withOpacity(0.9),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(12),
                          topLeft: Radius.circular(12)),
                      border: Border.all(),
                    ),
                    child: Center(
                      child: Text(
                        widget.categoryName,
                        style: _isHovering
                            ? Theme.of(context).textTheme.titleMedium
                            : Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.white, ),
                       
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoriesScreens extends StatefulWidget {
  const CategoriesScreens({super.key});

  @override
  State<CategoriesScreens> createState() => _CategoriesScreensState();
}

class _CategoriesScreensState extends State<CategoriesScreens> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 80),
      child: Column(
        children: [
          Row(
            children: [
              CategoriesItem(
                  categoryName: "EP Records",
                  categoryImage:
                      "https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/Categories%2FE.P.jpg?alt=media&token=2f818485-eb50-4cd8-8965-da332358771d",
                  onTap: () => {}),
              SizedBox(
                width: 16,
              ),
              CategoriesItem(
                  categoryName: "LP Records",
                  categoryImage:
                      "https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/Categories%2FL.P.jpg?alt=media&token=b11c957d-8754-4590-9447-f8d20e002ef2",
                  onTap: () => {}),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              CategoriesItem(
                  categoryName: "SP Records",
                  categoryImage:
                      "https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/Categories%2FS.P.jpg?alt=media&token=ccb870ea-75cf-4367-abdc-9de019d5a5b7",
                  onTap: () => {}),
              SizedBox(
                width: 16,
              ),
              CategoriesItem(
                  categoryName: "Compact Discs",
                  categoryImage:
                      "https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/Categories%2FCD2.jpg?alt=media&token=47b71db8-d747-4d7e-a73d-d61f92e3e18b",
                  onTap: () => {})
            ],
          ),
        ],
      ),
    );
  }
}
