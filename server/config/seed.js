/**
 * Populate DB with sample data on server start
 * to disable, edit config/environment/index.js, and set `seedDB: false`
 */

'use strict';

var Thing = require('../api/thing/thing.model');
var User = require('../api/user/user.model');
var Post = require('../api/post/post.model');

Thing.find({}).remove(function() {
  Thing.create({
    name : 'Development Tools',
    info : 'Integration with popular tools such as Bower, Grunt, Karma, Mocha, JSHint, Node Inspector, Livereload, Protractor, Jade, Stylus, Sass, CoffeeScript, and Less.'
  }, {
    name : 'Server and Client integration',
    info : 'Built with a powerful and fun stack: MongoDB, Express, AngularJS, and Node.'
  }, {
    name : 'Smart Build System',
    info : 'Build system ignores `spec` files, allowing you to keep tests alongside code. Automatic injection of scripts and styles into your index.html'
  },  {
    name : 'Modular Structure',
    info : 'Best practice client and server structures allow for more code reusability and maximum scalability'
  },  {
    name : 'Optimized Build',
    info : 'Build process packs up your templates as a single JavaScript payload, minifies your scripts/css/images, and rewrites asset names for caching.'
  },{
    name : 'Deployment Ready',
    info : 'Easily deploy your app to Heroku or Openshift with the heroku and openshift subgenerators'
  });
});

User.find({}).remove(function() {
  User.create({
    provider: 'local',
    name: 'Test User',
    email: 'test@test.com',
    password: 'test'
  }, {
    provider: 'local',
    role: 'admin',
    name: 'Admin',
    email: 'admin@admin.com',
    password: 'admin'
  }, {
    provider: 'local',
    role: '',
    name: '田村 洋輔',
    email: 'tamura.yosuke.tp8@is.naist.jp',
    organization: 'NAIST',
    bio: '次郎系ラーメンが好きです。',
    password: 'yosuke'
  }, function() {
      console.log('finished populating users');
    }
  );
});

var u;
User
    .find().
    where({ 'name': 'Test User' })
    .exec(function(err, user) {
        u = user._id;
    });

Post.find({}).remove(function() {
    Post.create({
        creator: u,
        title: 'おいしいラーメン屋の見つけ方',
        markdown: '# あえて有名店をはずす\n\n 有名店はもちろんおいしいラーメンを出すところが多いですが、そこをあえて外してみましょう。\n\n# 激戦区をねらえ\n\n京都、大阪',
        tags: ['ラーメン', 'つけ麺', 'グルメ'],
        published: true
    }, {
        creator: u,
        title: '公開記事',
        markdown: 'テスト',
        tags: ['テスト', 'test'],
        published: true
    }, {
        creator: u,
        title: '非公開記事',
        markdown: '# 非公開記事です',
        tags: [],
        published: false
    }, function() {
        console.log('add test posts');
    });
});
