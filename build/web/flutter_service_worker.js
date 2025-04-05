'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "464dca46b5f3157080f4db918ec8727f",
"assets/AssetManifest.bin.json": "8679cff48d50af031701264aafbb27c9",
"assets/AssetManifest.json": "3c44b4453f47e909145d257338f6a216",
"assets/assets/fonts/PoorStory-Regular.ttf": "21d15c9110b18b49d69602323f1a7b36",
"assets/assets/fonts/Urbanist-Regular.ttf": "4c1ae1074c39cca3b3fd7a788b5afd96",
"assets/assets/images/collegeTour.webp": "1936667b628c4bcd7a88f9abaebb2347",
"assets/assets/images/grouptour.webp": "4dd0a4dd858a6a913bae693e33e3c7a9",
"assets/assets/images/honeymoon.webp": "47ff142fbd022aed900849c8685830c4",
"assets/assets/images/kanyakumari.webp": "164699d7f560c763c77665aa9df75e87",
"assets/assets/images/Kodaikanal.webp": "0d309c109dda5b955c131d407303e15a",
"assets/assets/images/madurai.webp": "25249b2995f909ee74559dd1196a1cb3",
"assets/assets/images/navatirupathi.webp": "2dffacaf17b26b8f9899a5075c571084",
"assets/assets/images/ooty.webp": "7e2b669863413d6ed6cb481ea63f739b",
"assets/assets/images/social/insta.webp": "e86c249639694b74cd868927c209f50c",
"assets/assets/images/studentTour.webp": "65010ed2c50c86a968b56b7a66573015",
"assets/assets/images/taxi.webp": "60504f78b4aec81e3f4948128a4dc721",
"assets/assets/images/temples/temple1.webp": "d1b2a1c9daa5afeb505ee771c0b3571f",
"assets/assets/images/temples/temple2.webp": "7ab6f08b6212d4928c2f3180491ba046",
"assets/assets/images/temples/temple3.webp": "ba6e291ca1a3fd86a3517f366aaf08ff",
"assets/assets/images/temples/temple4.webp": "599fda715dd2550fb4223b18ac2f3682",
"assets/assets/images/temples/temple5.webp": "61bb9f8b3b7a75f72f02beef7be0ed3a",
"assets/assets/images/temples/temple6.webp": "abd2d258f20be424969062db18de80d2",
"assets/assets/images/temples/temple7.webp": "0d1ce929992afb0e19a4c4fe6731f83c",
"assets/assets/images/temples/temple8.webp": "d94e7613b308398f3b3080099779d66a",
"assets/assets/images/Thanjavur.webp": "42aa737906dc8a15a8c239005437e229",
"assets/assets/images/TNtour.webp": "828cab26bbe8a0c68aa811927b2b712a",
"assets/assets/images/whatsapp.webp": "a403e2130500f46cae70f722e07124e7",
"assets/FontManifest.json": "ea79ceccbb66ace406b5e88f349ee23c",
"assets/fonts/MaterialIcons-Regular.otf": "42caba40c9220954e112790071822888",
"assets/NOTICES": "25d66430e00bc87729044827431d78e8",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "7c9f00a662213109afd9574284b39726",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "b8daa36ebc3604267cc3d1afc5b881e3",
"/": "b8daa36ebc3604267cc3d1afc5b881e3",
"main.dart.js": "a5d2424ad6620bb9b199ddd11e8d4fff",
"manifest.json": "fd46e35bcbb5a70720f78fe979b26333",
"robots.txt": "2d49ced38576ffde1cf969fbc1c06196",
"sitemap.xml": "bac6a56d5c8125f5e8b08a0ca0d0338b",
"version.json": "d785a9aa6eb47eb2bdcbc307eb75dc39",
"_headers": "9af0edf81396ce899b08c92b265b9b5d"};
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
