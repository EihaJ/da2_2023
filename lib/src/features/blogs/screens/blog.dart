import 'package:da22023/src/common_widgets/appbar.dart';
import 'package:da22023/src/common_widgets/cta_button.dart';
import 'package:da22023/src/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../widget/blog_card.dart';

class BlogScreen extends StatefulWidget {
  BlogScreen();

  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  int _postCount = 6; // Initial number of blog posts to display
  final List<BlogPost> _blogPosts = [
    BlogPost(
      title: 'How to Build a Flutter App',
      author: 'John Doe',
      date: 'April 22, 2023',
      image: blog_1,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id nisi a justo volutpat consequat eu eu tellus. Vestibulum rhoncus lacus ut diam tempor, ut consectetur nisi hendrerit. Phasellus sit amet dui metus. Sed maximus malesuada erat, eu consequat mauris aliquet ut. Sed sit amet odio in massa convallis bibendum. Morbi nec enim vel mauris rutrum pharetra. Donec et nunc libero. Nam vel quam eget metus dapibus fermentum. Proin tincidunt tempor est id rhoncus. Sed sem nulla, ullamcorper eu nisl non, fermentum aliquam eros.',
      link: '',
    ),
    BlogPost(
      title: '10 Tips for Better Flutter Performance',
      author: 'Jane Smith',
      date: 'April 21, 2023',
      image: blog_2,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id nisi a justo volutpat consequat eu eu tellus. Vestibulum rhoncus lacus ut diam tempor, ut consectetur nisi hendrerit. Phasellus sit amet dui metus. Sed maximus malesuada erat, eu consequat mauris aliquet ut. Sed sit amet odio in massa convallis bibendum. Morbi nec enim vel mauris rutrum pharetra. Donec et nunc libero. Nam vel quam eget metus dapibus fermentum. Proin tincidunt tempor est id rhoncus. Sed sem nulla, ullamcorper eu nisl non, fermentum aliquam eros.',
      link: '',
    ),
    BlogPost(
      title: 'How to Build a Flutter App',
      author: 'John Doe',
      date: 'April 22, 2023',
      image: blog_1,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id nisi a justo volutpat consequat eu eu tellus. Vestibulum rhoncus lacus ut diam tempor, ut consectetur nisi hendrerit. Phasellus sit amet dui metus. Sed maximus malesuada erat, eu consequat mauris aliquet ut. Sed sit amet odio in massa convallis bibendum. Morbi nec enim vel mauris rutrum pharetra. Donec et nunc libero. Nam vel quam eget metus dapibus fermentum. Proin tincidunt tempor est id rhoncus. Sed sem nulla, ullamcorper eu nisl non, fermentum aliquam eros.',
      link: '',
    ),
    BlogPost(
      title: '10 Tips for Better Flutter Performance',
      author: 'Jane Smith',
      date: 'April 21, 2023',
      image: blog_2,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id nisi a justo volutpat consequat eu eu tellus. Vestibulum rhoncus lacus ut diam tempor, ut consectetur nisi hendrerit. Phasellus sit amet dui metus. Sed maximus malesuada erat, eu consequat mauris aliquet ut. Sed sit amet odio in massa convallis bibendum. Morbi nec enim vel mauris rutrum pharetra. Donec et nunc libero. Nam vel quam eget metus dapibus fermentum. Proin tincidunt tempor est id rhoncus. Sed sem nulla, ullamcorper eu nisl non, fermentum aliquam eros.',
      link: '',
    ),
    BlogPost(
      title: 'How to Build a Flutter App',
      author: 'John Doe',
      date: 'April 22, 2023',
      image: blog_1,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id nisi a justo volutpat consequat eu eu tellus. Vestibulum rhoncus lacus ut diam tempor, ut consectetur nisi hendrerit. Phasellus sit amet dui metus. Sed maximus malesuada erat, eu consequat mauris aliquet ut. Sed sit amet odio in massa convallis bibendum. Morbi nec enim vel mauris rutrum pharetra. Donec et nunc libero. Nam vel quam eget metus dapibus fermentum. Proin tincidunt tempor est id rhoncus. Sed sem nulla, ullamcorper eu nisl non, fermentum aliquam eros.',
      link: '',
    ),
    BlogPost(
      title: '10 Tips for Better Flutter Performance',
      author: 'Jane Smith',
      date: 'April 21, 2023',
      image: blog_2,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id nisi a justo volutpat consequat eu eu tellus. Vestibulum rhoncus lacus ut diam tempor, ut consectetur nisi hendrerit. Phasellus sit amet dui metus. Sed maximus malesuada erat, eu consequat mauris aliquet ut. Sed sit amet odio in massa convallis bibendum. Morbi nec enim vel mauris rutrum pharetra. Donec et nunc libero. Nam vel quam eget metus dapibus fermentum. Proin tincidunt tempor est id rhoncus. Sed sem nulla, ullamcorper eu nisl non, fermentum aliquam eros.',
      link: '',
    ),
    BlogPost(
      title: 'How to Build a Flutter App',
      author: 'John Doe',
      date: 'April 22, 2023',
      image: blog_1,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id nisi a justo volutpat consequat eu eu tellus. Vestibulum rhoncus lacus ut diam tempor, ut consectetur nisi hendrerit. Phasellus sit amet dui metus. Sed maximus malesuada erat, eu consequat mauris aliquet ut. Sed sit amet odio in massa convallis bibendum. Morbi nec enim vel mauris rutrum pharetra. Donec et nunc libero. Nam vel quam eget metus dapibus fermentum. Proin tincidunt tempor est id rhoncus. Sed sem nulla, ullamcorper eu nisl non, fermentum aliquam eros.',
      link: '',
    ),
    BlogPost(
      title: '10 Tips for Better Flutter Performance',
      author: 'Jane Smith',
      date: 'April 21, 2023',
      image: blog_2,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id nisi a justo volutpat consequat eu eu tellus. Vestibulum rhoncus lacus ut diam tempor, ut consectetur nisi hendrerit. Phasellus sit amet dui metus. Sed maximus malesuada erat, eu consequat mauris aliquet ut. Sed sit amet odio in massa convallis bibendum. Morbi nec enim vel mauris rutrum pharetra. Donec et nunc libero. Nam vel quam eget metus dapibus fermentum. Proin tincidunt tempor est id rhoncus. Sed sem nulla, ullamcorper eu nisl non, fermentum aliquam eros.',
      link: '',
    ),
    BlogPost(
      title: 'How to Build a Flutter App',
      author: 'John Doe',
      date: 'April 22, 2023',
      image: blog_1,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id nisi a justo volutpat consequat eu eu tellus. Vestibulum rhoncus lacus ut diam tempor, ut consectetur nisi hendrerit. Phasellus sit amet dui metus. Sed maximus malesuada erat, eu consequat mauris aliquet ut. Sed sit amet odio in massa convallis bibendum. Morbi nec enim vel mauris rutrum pharetra. Donec et nunc libero. Nam vel quam eget metus dapibus fermentum. Proin tincidunt tempor est id rhoncus. Sed sem nulla, ullamcorper eu nisl non, fermentum aliquam eros.',
      link: '',
    ),
    BlogPost(
      title: '10 Tips for Better Flutter Performance',
      author: 'Jane Smith',
      date: 'April 21, 2023',
      image: blog_2,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id nisi a justo volutpat consequat eu eu tellus. Vestibulum rhoncus lacus ut diam tempor, ut consectetur nisi hendrerit. Phasellus sit amet dui metus. Sed maximus malesuada erat, eu consequat mauris aliquet ut. Sed sit amet odio in massa convallis bibendum. Morbi nec enim vel mauris rutrum pharetra. Donec et nunc libero. Nam vel quam eget metus dapibus fermentum. Proin tincidunt tempor est id rhoncus. Sed sem nulla, ullamcorper eu nisl non, fermentum aliquam eros.',
      link: '',
    ),
    BlogPost(
      title: 'How to Build a Flutter App',
      author: 'John Doe',
      date: 'April 22, 2023',
      image: blog_1,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id nisi a justo volutpat consequat eu eu tellus. Vestibulum rhoncus lacus ut diam tempor, ut consectetur nisi hendrerit. Phasellus sit amet dui metus. Sed maximus malesuada erat, eu consequat mauris aliquet ut. Sed sit amet odio in massa convallis bibendum. Morbi nec enim vel mauris rutrum pharetra. Donec et nunc libero. Nam vel quam eget metus dapibus fermentum. Proin tincidunt tempor est id rhoncus. Sed sem nulla, ullamcorper eu nisl non, fermentum aliquam eros.',
      link: '',
    ),
    BlogPost(
      title: '10 Tips for Better Flutter Performance',
      author: 'Jane Smith',
      date: 'April 21, 2023',
      image: blog_2,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id nisi a justo volutpat consequat eu eu tellus. Vestibulum rhoncus lacus ut diam tempor, ut consectetur nisi hendrerit. Phasellus sit amet dui metus. Sed maximus malesuada erat, eu consequat mauris aliquet ut. Sed sit amet odio in massa convallis bibendum. Morbi nec enim vel mauris rutrum pharetra. Donec et nunc libero. Nam vel quam eget metus dapibus fermentum. Proin tincidunt tempor est id rhoncus. Sed sem nulla, ullamcorper eu nisl non, fermentum aliquam eros.',
      link: '',
    ),
    BlogPost(
      title: 'How to Build a Flutter App',
      author: 'John Doe',
      date: 'April 22, 2023',
      image: blog_1,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id nisi a justo volutpat consequat eu eu tellus. Vestibulum rhoncus lacus ut diam tempor, ut consectetur nisi hendrerit. Phasellus sit amet dui metus. Sed maximus malesuada erat, eu consequat mauris aliquet ut. Sed sit amet odio in massa convallis bibendum. Morbi nec enim vel mauris rutrum pharetra. Donec et nunc libero. Nam vel quam eget metus dapibus fermentum. Proin tincidunt tempor est id rhoncus. Sed sem nulla, ullamcorper eu nisl non, fermentum aliquam eros.',
      link: '',
    ),
    BlogPost(
      title: '10 Tips for Better Flutter Performance',
      author: 'Jane Smith',
      date: 'April 21, 2023',
      image: blog_2,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id nisi a justo volutpat consequat eu eu tellus. Vestibulum rhoncus lacus ut diam tempor, ut consectetur nisi hendrerit. Phasellus sit amet dui metus. Sed maximus malesuada erat, eu consequat mauris aliquet ut. Sed sit amet odio in massa convallis bibendum. Morbi nec enim vel mauris rutrum pharetra. Donec et nunc libero. Nam vel quam eget metus dapibus fermentum. Proin tincidunt tempor est id rhoncus. Sed sem nulla, ullamcorper eu nisl non, fermentum aliquam eros.',
      link: '',
    ),
    BlogPost(
      title: 'How to Build a Flutter App',
      author: 'John Doe',
      date: 'April 22, 2023',
      image: blog_1,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id nisi a justo volutpat consequat eu eu tellus. Vestibulum rhoncus lacus ut diam tempor, ut consectetur nisi hendrerit. Phasellus sit amet dui metus. Sed maximus malesuada erat, eu consequat mauris aliquet ut. Sed sit amet odio in massa convallis bibendum. Morbi nec enim vel mauris rutrum pharetra. Donec et nunc libero. Nam vel quam eget metus dapibus fermentum. Proin tincidunt tempor est id rhoncus. Sed sem nulla, ullamcorper eu nisl non, fermentum aliquam eros.',
      link: '',
    ),
    BlogPost(
      title: '10 Tips for Better Flutter Performance',
      author: 'Jane Smith',
      date: 'April 21, 2023',
      image: blog_2,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id nisi a justo volutpat consequat eu eu tellus. Vestibulum rhoncus lacus ut diam tempor, ut consectetur nisi hendrerit. Phasellus sit amet dui metus. Sed maximus malesuada erat, eu consequat mauris aliquet ut. Sed sit amet odio in massa convallis bibendum. Morbi nec enim vel mauris rutrum pharetra. Donec et nunc libero. Nam vel quam eget metus dapibus fermentum. Proin tincidunt tempor est id rhoncus. Sed sem nulla, ullamcorper eu nisl non, fermentum aliquam eros.',
      link: '',
    ),
    BlogPost(
      title: 'How to Build a Flutter App',
      author: 'John Doe',
      date: 'April 22, 2023',
      image: blog_1,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id nisi a justo volutpat consequat eu eu tellus. Vestibulum rhoncus lacus ut diam tempor, ut consectetur nisi hendrerit. Phasellus sit amet dui metus. Sed maximus malesuada erat, eu consequat mauris aliquet ut. Sed sit amet odio in massa convallis bibendum. Morbi nec enim vel mauris rutrum pharetra. Donec et nunc libero. Nam vel quam eget metus dapibus fermentum. Proin tincidunt tempor est id rhoncus. Sed sem nulla, ullamcorper eu nisl non, fermentum aliquam eros.',
      link: '',
    ),
    BlogPost(
      title: '10 Tips for Better Flutter Performance',
      author: 'Jane Smith',
      date: 'April 21, 2023',
      image: blog_2,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id nisi a justo volutpat consequat eu eu tellus. Vestibulum rhoncus lacus ut diam tempor, ut consectetur nisi hendrerit. Phasellus sit amet dui metus. Sed maximus malesuada erat, eu consequat mauris aliquet ut. Sed sit amet odio in massa convallis bibendum. Morbi nec enim vel mauris rutrum pharetra. Donec et nunc libero. Nam vel quam eget metus dapibus fermentum. Proin tincidunt tempor est id rhoncus. Sed sem nulla, ullamcorper eu nisl non, fermentum aliquam eros.',
      link: '',
    ),
    BlogPost(
      title: 'How to Build a Flutter App',
      author: 'John Doe',
      date: 'April 22, 2023',
      image: blog_1,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id nisi a justo volutpat consequat eu eu tellus. Vestibulum rhoncus lacus ut diam tempor, ut consectetur nisi hendrerit. Phasellus sit amet dui metus. Sed maximus malesuada erat, eu consequat mauris aliquet ut. Sed sit amet odio in massa convallis bibendum. Morbi nec enim vel mauris rutrum pharetra. Donec et nunc libero. Nam vel quam eget metus dapibus fermentum. Proin tincidunt tempor est id rhoncus. Sed sem nulla, ullamcorper eu nisl non, fermentum aliquam eros.',
      link: '',
    ),
    BlogPost(
      title: '10 Tips for Better Flutter Performance',
      author: 'Jane Smith',
      date: 'April 21, 2023',
      image: blog_2,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id nisi a justo volutpat consequat eu eu tellus. Vestibulum rhoncus lacus ut diam tempor, ut consectetur nisi hendrerit. Phasellus sit amet dui metus. Sed maximus malesuada erat, eu consequat mauris aliquet ut. Sed sit amet odio in massa convallis bibendum. Morbi nec enim vel mauris rutrum pharetra. Donec et nunc libero. Nam vel quam eget metus dapibus fermentum. Proin tincidunt tempor est id rhoncus. Sed sem nulla, ullamcorper eu nisl non, fermentum aliquam eros.',
      link: '',
    ),
    BlogPost(
      title: 'How to Build a Flutter App',
      author: 'John Doe',
      date: 'April 22, 2023',
      image: blog_1,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id nisi a justo volutpat consequat eu eu tellus. Vestibulum rhoncus lacus ut diam tempor, ut consectetur nisi hendrerit. Phasellus sit amet dui metus. Sed maximus malesuada erat, eu consequat mauris aliquet ut. Sed sit amet odio in massa convallis bibendum. Morbi nec enim vel mauris rutrum pharetra. Donec et nunc libero. Nam vel quam eget metus dapibus fermentum. Proin tincidunt tempor est id rhoncus. Sed sem nulla, ullamcorper eu nisl non, fermentum aliquam eros.',
      link: '',
    ),
    BlogPost(
      title: '10 Tips for Better Flutter Performance',
      author: 'Jane Smith',
      date: 'April 21, 2023',
      image: blog_2,
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id nisi a justo volutpat consequat eu eu tellus. Vestibulum rhoncus lacus ut diam tempor, ut consectetur nisi hendrerit. Phasellus sit amet dui metus. Sed maximus malesuada erat, eu consequat mauris aliquet ut. Sed sit amet odio in massa convallis bibendum. Morbi nec enim vel mauris rutrum pharetra. Donec et nunc libero. Nam vel quam eget metus dapibus fermentum. Proin tincidunt tempor est id rhoncus. Sed sem nulla, ullamcorper eu nisl non, fermentum aliquam eros.',
      link: '',
    ),
    // Add more blog posts here
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1.2),
        itemCount: _blogPosts.length <= _postCount
            ? _blogPosts.length
            : _postCount + 2, // Add 1 for the "Load More" button
        itemBuilder: (BuildContext context, int index) {
          if (index < _postCount) {
            // Display the blog post
            return BlogCard(
              blogPost: _blogPosts[index],
            );
          } else {
            if (index == _postCount)
              return Container();
            else {
              // Display the "Load More" button
              if (_blogPosts.length <= _postCount) {
                // There are no more blog posts to show
                return Container();
              } else {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CTAButton(
                      text: 'Load More',
                      onPressed: () {
                        setState(
                          () {
                            _postCount +=
                                6; // Increase the number of blog posts to display by 3
                          },
                        );
                      },
                    ),
                  ],
                );
              }
            }
          }
        },
      ),
    );
  }
}
