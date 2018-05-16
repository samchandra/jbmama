class Feed {
  final String message;
  final int timestamp;
  final String imgURL;
  final String avatarURL;
  final String userName;

  Feed(this.message, this.timestamp, this.imgURL, this.avatarURL, this.userName);
}

List<Feed> sampleFeed = [
  Feed("Look at this, when are we going to arrive in JB? Why did we lose JB why tell me why?", 
    (DateTime.now().millisecondsSinceEpoch/1000).floor(), 
    "http://www.asiaone.com/sites/default/files/styles/700x500/public/original_images/Feb2016/20160206_fb_checkpointqueues.jpg?itok=fRrPZHkH",
    "http://1075koolfm.com/wp-content/uploads/2018/04/taylor-swift-grammys-2015-a-billboard-1548-1000x500.jpg",
    "Taylor Swift",
  ),
  Feed("I will die in this queue :(",
    (DateTime.now().millisecondsSinceEpoch/1000).floor() - 300,
    "http://firstpullzone.sgmytransportpla.netdna-cdn.com/wp-content/uploads/Johor-Singapore-custom-jam.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/a/a7/Najib_Razak_2008-08-21.jpg",
    "Najib",
  ),
  Feed("I should have agreed to build the damn RTS long time ago. Its too late now",
    (DateTime.now().millisecondsSinceEpoch/1000).floor() - 600,
    "https://www.nusatransport.com/wp-content/uploads/Long-Queue-in-Singapore-JB-Checkpoints.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/a/a7/Najib_Razak_2008-08-21.jpg",
    "Najib",
  ),
  Feed("Its a long long wait.  I will be so bored long long",
    (DateTime.now().millisecondsSinceEpoch/1000).floor() - 900,
    "https://static.wixstatic.com/media/ee8e9b_c3de945dce344275a9b2fc50f3c10bf2~mv2.jpg/v1/fill/w_630,h_437,al_c,q_80,usm_0.66_1.00_0.01/ee8e9b_c3de945dce344275a9b2fc50f3c10bf2~mv2.webp",
    "https://upload.wikimedia.org/wikipedia/commons/a/a7/Najib_Razak_2008-08-21.jpg",
    "Najib",
  ),
];

List<Feed> sampleFeed2 = [
  Feed("I am going back SG sigh.... food and things are nicer is JB", 
    (DateTime.now().millisecondsSinceEpoch/1000).floor(), 
    "https://1travels2live.files.wordpress.com/2015/01/wpid-20141231_122748.jpg",
    "https://images-na.ssl-images-amazon.com/images/I/51XBYaeg1lL.jpg",
    "Shawn Mendes",
  ),
  Feed("How am i supposed to go back home ...... so many people going back SG",
    (DateTime.now().millisecondsSinceEpoch/1000).floor() - 300,
    "http://www.nextsingapo.com/wp-content/uploads/2016/03/SINGAPORE-TO-JB-CUSTOM.jpg",
    "https://images.allsingaporestuff.com/styles/big_within_article/s3/field/image/mrbrown_angry.jpg?itok=Iuztfk2T",
    "Mr Brown",
  ),
  Feed("I should have gone home yesterday .... too late now",
    (DateTime.now().millisecondsSinceEpoch/1000).floor() - 600,
    "https://123cg.files.wordpress.com/2011/08/2011-07-22-19-17-28.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/a/a7/Najib_Razak_2008-08-21.jpg",
    "Najib",
  ),
  Feed("Where is my chopper. I can't queue, my legs sakit lah",
    (DateTime.now().millisecondsSinceEpoch/1000).floor() - 900,
    "http://4.bp.blogspot.com/-C0oX_FaG7BE/VL9gWu-8CwI/AAAAAAAAAEs/JhMDVc8bXzk/s1600/IMG_0915.JPG",
    "https://upload.wikimedia.org/wikipedia/commons/a/a7/Najib_Razak_2008-08-21.jpg",
    "Najib",
  ),
];