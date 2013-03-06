jQuery ->

  $.backstretch("/assets/bg.jpg")

  Shadowbox.init();
  
  Shadowbox.setup("ul.gallery a", {
    gallery:        "gallery",
    continuous:     true,
    counterType:    "skip"
  });