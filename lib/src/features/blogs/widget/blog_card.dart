import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlogPost {
  final String title;
  final String author;
  final String date;
  final String image;
  final String content;
  final String link;

  BlogPost({
    required this.title,
    required this.author,
    required this.date,
    required this.image,
    required this.content,
    required this.link,
  });
}

class BlogCard extends StatelessWidget {
  final BlogPost blogPost;

  const BlogCard({required this.blogPost});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            
            onTap: () {
              Get.to(blogPost.link);
              print('open blog');
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(),
              ),
              child: Column(
                
                children: [
                  SizedBox(
                    height: 160,
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      child: Image.asset(
                        blogPost.image,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 64),
                          child: Text(
                            blogPost.title,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        const SizedBox(
                          width: 48,
                          child: Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          blogPost.content,
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              blogPost.author,
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              blogPost.date,
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
