class Topics {
 late String label;
 late String imageUrl;

 Topics({required this.label, required this.imageUrl});

 static List<Topics> samples = [
  Topics(label: 'Chemistry', imageUrl: 'assets/images/chemistry.png'),
  Topics(label: 'Math', imageUrl: 'assets/images/math.png'),
  Topics(label: 'History', imageUrl: 'assets/images/history.png'),
  Topics(label: 'Geography', imageUrl: 'assets/images/geo.png'),
  Topics(label: 'Life Science', imageUrl: 'assets/images/science.png'),
  Topics(label: 'Anatomy', imageUrl: 'assets/images/anatomy.png'),
  Topics(label: 'Physics', imageUrl: 'assets/images/physics.png'),
  Topics(label: 'Architecture', imageUrl: 'assets/images/arch.png'),
 ];

}

