'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "2a2d3c4e4a4a10429fc762449cbf5335",
"version.json": "009c9e65172e010890f7f65fde438006",
"index.html": "80b7f3c2a7bb29c643595523dbc0fc2e",
"/": "80b7f3c2a7bb29c643595523dbc0fc2e",
"main.dart.js": "3e0be408e5f5e9c1292d29563f263541",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "d40c47d1c161f94dbcb13094d37f1f55",
"assets/AssetManifest.json": "fae243268cf1df9e3b93aaf4fa688ca3",
"assets/NOTICES": "efa201e07018141c33d11a2515291f19",
"assets/FontManifest.json": "d6679bba33722c99afc1b21ec7587caf",
"assets/AssetManifest.bin.json": "5867868cdfb7d7f32860543ac847a9ec",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "9037e777c5e29610f17622f0e036a662",
"assets/fonts/MaterialIcons-Regular.otf": "c0ad29d56cfe3890223c02da3c6e0448",
"assets/assets/images/mockup.jpg": "3cec0e60f27022915b3509688d8ceb7f",
"assets/assets/images/loading.gif": "ff72b8566e30b77596fbfb5e2a701a73",
"assets/assets/images/my_doses.jpg": "cfb4c6f872910913137f1ca9f64677e9",
"assets/assets/images/apple.png": "bb6cbb9f99619b67e6ede3b588a0cda8",
"assets/assets/images/masterpiece_studio.jpg": "c595e5917bf637aad6a2bb25818fd59f",
"assets/assets/images/art_loading.gif": "a4eec4e757f7a0b1cd900ec75e5971b5",
"assets/assets/images/play_store.png": "db9b21a1c41f3dcd9731e1e7acfdbb57",
"assets/assets/images/google.png": "601c69273969aaf4fa7c41be80194204",
"assets/assets/images/app_store.png": "29a7b241f0d17d50120808d873725b8f",
"assets/assets/images/nothing.gif": "5b35028b288f58fe62f81ff546f37c13",
"assets/assets/images/doses_delivery.jpg": "d647938e9752d7da581f497b1c713e19",
"assets/assets/ss/4.png": "9a6eca9e51f6267a23e8c2f3e48509d6",
"assets/assets/ss/5.png": "345c0cd5978dcbad88253f86ecdb1c8a",
"assets/assets/ss/2.png": "46e79c360beeacdc1875ea8d9c3c9dba",
"assets/assets/ss/3.png": "9249630a274c33d34fa3548a69a921b0",
"assets/assets/ss/1.png": "7f0175b3611440555f3af3f2ae58aa30",
"assets/assets/ss/0.png": "c46912aeae7e6c28337f5cc7125b0aa5",
"assets/assets/lottie/heart.json": "aac8eb041f675e2727c94577cfdb8ab0",
"assets/assets/lottie/ghost.json": "d31a254add2a5f080ebae2b6efb518b0",
"assets/assets/lottie/bookmark.json": "800cc9a4e1ef3ae1477e911b28a5016e",
"assets/assets/lottie/image_analysis.json": "ed7b978fae7e8affd5aa994c0d7ef365",
"assets/assets/fonts/PlayFair/PlayfairDisplay-Bold.ttf": "2cc98ebee00fb87618f4e894a3614d77",
"assets/assets/fonts/PlayFair/PlayfairDisplay-SemiBold.ttf": "6165164d7463f005bbf9db13fc92bac1",
"assets/assets/fonts/PlayFair/PlayfairDisplay-Medium.ttf": "6b6f0053a6811a9381a9fa488ac76cb0",
"assets/assets/fonts/PlayFair/PlayfairDisplay-BoldItalic.ttf": "15660f05f3f5742800724772a2112625",
"assets/assets/fonts/PlayFair/PlayfairDisplay-ExtraBoldItalic.ttf": "a2106aaaf8f2da3b65673f6107b4a074",
"assets/assets/fonts/PlayFair/PlayfairDisplay-Italic.ttf": "8969f2415be9fd1fea2f3bc7b72baa73",
"assets/assets/fonts/PlayFair/PlayfairDisplay-Regular.ttf": "b3721ba3bde34e5b38b0e1523cccfd7f",
"assets/assets/fonts/PlayFair/PlayfairDisplay-Black.ttf": "6b2baf9d620742fff583c66e6bb2bedb",
"assets/assets/fonts/PlayFair/PlayfairDisplay-SemiBoldItalic.ttf": "9e8866b265ef8abaecb0a10766713edd",
"assets/assets/fonts/PlayFair/PlayfairDisplay-MediumItalic.ttf": "ecd99b74189fc2d323c7725b29470f39",
"assets/assets/fonts/PlayFair/PlayfairDisplay-BlackItalic.ttf": "8e4c72666923aceca0b6a68dcadf334c",
"assets/assets/fonts/PlayFair/PlayfairDisplay-ExtraBold.ttf": "75ee27eb9a26bfef5ac0d477630f234b",
"assets/assets/fonts/Britney/Britney-Bold.otf": "d1451f46380807ab5181094051d3faf7",
"assets/assets/fonts/Britney/Britney-Regular.otf": "e9db232536b14534a92196dd788fa443",
"assets/assets/fonts/Britney/Britney-Light.otf": "800e73a10a52ad2fd6cce7a41f9775ad",
"assets/assets/fonts/Britney/Britney-Ultra.otf": "7a21b3793b6b93abf955d0f310ebd669",
"assets/assets/fonts/Boska/Boska-Bold.otf": "56f6b673d14486e46728a77ec4824159",
"assets/assets/fonts/Boska/Boska-Regular.otf": "18083e851e9f5097bb24ee9f11036f88",
"assets/assets/fonts/Boska/Boska-Medium.otf": "5286c434c4249557d62c5e8cd3edae37",
"assets/assets/fonts/Boska/Boska-Black.otf": "fdf23f60d747d1a655bf0973fa055013",
"assets/assets/fonts/Boska/Boska-LightItalic.otf": "dd8f0ac7492b27ba9ea8f2e80f26c259",
"assets/assets/fonts/Boska/Boska-MediumItalic.otf": "9c01588aedc9048fef572f1d266e0686",
"assets/assets/fonts/Boska/Boska-BlackItalic.otf": "a073c7a6357142011abc802d7383fed3",
"assets/assets/fonts/Boska/Boska-ExtralightItalic.otf": "d1b0e62fbb19280a652b4fdfb9917293",
"assets/assets/fonts/Boska/Boska-Light.otf": "bedacfe1d5bf59f02154d833a784e65d",
"assets/assets/fonts/Boska/Boska-Italic.otf": "2719e5b3bf770ecbbd122d0434e2ced3",
"assets/assets/fonts/Boska/Boska-Extralight.otf": "c49f2a8cd0eaa816ed734719e756d77e",
"assets/assets/fonts/Boska/Boska-BoldItalic.otf": "4f19e64e68746209eef983d7dfa2b32b",
"assets/assets/fonts/Rowan/Rowan-Semibold.otf": "981ddbbb87a2654c727d441059140c62",
"assets/assets/fonts/Rowan/Rowan-LightItalic.otf": "f2d16971727951f77d154b92331fdb86",
"assets/assets/fonts/Rowan/Rowan-MediumItalic.otf": "e9b4414ab0a847b266d9535700231321",
"assets/assets/fonts/Rowan/Rowan-Light.otf": "2ae1dd2d6bcdaee09a43246eca13ff8d",
"assets/assets/fonts/Rowan/Rowan-Medium.otf": "e02cfe3201be38507b270d6f02233c8b",
"assets/assets/fonts/Rowan/Rowan-Bold.otf": "d6c19ee0eaeed4dadf70c6e037aee446",
"assets/assets/fonts/Rowan/Rowan-BoldItalic.otf": "26e9cd1dae87dcb1ec4e420606abb207",
"assets/assets/fonts/Rowan/Rowan-Italic.otf": "dff04fa00de62c3969f49546d3af1276",
"assets/assets/fonts/Rowan/Rowan-Regular.otf": "9fdf32f3f7941ff47d84ceee8473200f",
"assets/assets/fonts/Rowan/Rowan-SemiboldItalic.otf": "3b8483a1783a4427e1c57a5e817629b2",
"assets/assets/fonts/Melodrama/Melodrama-Regular.otf": "f533d0d37f206e7b52ccd869dac3490d",
"assets/assets/fonts/Melodrama/Melodrama-SemiBold.otf": "5810eb6fb8f06eafaffc53c08b3e0e86",
"assets/assets/fonts/Melodrama/Melodrama-Bold.otf": "0906e7eecdc77e1be588bfea0f14b78f",
"assets/assets/fonts/Melodrama/Melodrama-Medium.otf": "ae74566cba9073b1fd0f8c4ecefd4a9c",
"assets/assets/fonts/Melodrama/Melodrama-Light.otf": "50680eb1f5fef44b5f48f26ea650be0a",
"assets/assets/fonts/Inter/Inter-Medium.ttf": "16580ed788273749548eb27b9a9b674f",
"assets/assets/fonts/Inter/Inter-Light.ttf": "60c8f64064078554b6469eeda25944eb",
"assets/assets/fonts/Inter/Inter-Bold.ttf": "d17c0274915408cee0308d5476df9f45",
"assets/assets/fonts/Inter/Inter-Regular.ttf": "a4a7379505cd554ea9523594b7c28b2a",
"assets/assets/fonts/Inter/Inter-ExtraBold.ttf": "e771faf703386b0c5863cc3df1e26ba1",
"assets/assets/fonts/Inter/Inter-ExtraLight.ttf": "c36ac5a28afa9a4d70292df06a932ccd",
"assets/assets/fonts/Inter/Inter-SemiBold.ttf": "1753a05196abeef95c32f10246bd6473",
"assets/assets/fonts/Quilon/Quilon-SemiBold.otf": "0ccac2ad552976c788e053ce72f26654",
"assets/assets/fonts/Quilon/Quilon-Medium.otf": "7d0000d0d1b759930f3eb5bba3403af0",
"assets/assets/fonts/Quilon/Quilon-Regular.otf": "4b8667b0916b9db901b7c1e1b869f1a1",
"assets/assets/fonts/Quilon/Quilon-Bold.otf": "86f80d354f2600f2780bb0abc72a3639",
"assets/assets/fonts/OldEnglish/OldEnglish.ttf": "10855bd3671eb9808ce923454510349a",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
