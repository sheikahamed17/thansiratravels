'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "ad8b48fb1c7d76fac4139b41fc93986f",
"assets/AssetManifest.bin.json": "3e2050e9e59f9128e6bd57411dd1e348",
"assets/AssetManifest.json": "9726ec3d626fcdc4dffc95d050fe6252",
"assets/assets/fonts/PoorStory-Regular.ttf": "21d15c9110b18b49d69602323f1a7b36",
"assets/assets/fonts/Urbanist-Regular.ttf": "4c1ae1074c39cca3b3fd7a788b5afd96",
"assets/assets/images/collegeTour.jpg": "0a7352543b689b984ff9874401a36c0c",
"assets/assets/images/grouptour.jpg": "46e109b2b55ff9a5a0e0c10957b7e546",
"assets/assets/images/honeymoon.jpg": "9600039f4f35e70ef01bbe37fd14304b",
"assets/assets/images/kanyakumari.jpg": "014d81a56c005d2dc8e05432b3cdd887",
"assets/assets/images/Kodaikanal.jpg": "6189a1bf85a31e8691b5bdc86785f1aa",
"assets/assets/images/madurai.jpg": "634ec67f3ac5334c2bc302c1c7bcc7b7",
"assets/assets/images/navatirupathi.jpg": "73836fe9beec9009839406c8241f65bb",
"assets/assets/images/ooty.jpg": "8b84bd87e74248efbdb4edb55abf96c3",
"assets/assets/images/social/insta.png": "a207e912e8e119e6e69ce17f0bf64170",
"assets/assets/images/studentTour.jpg": "a0e30aff5434c8693d824a19cca04a5d",
"assets/assets/images/taxi.png": "c88cce2dcf75a17c5429a63567968ec5",
"assets/assets/images/temples/temple1.jpg": "559296939c1606caca880a9eaaa3283b",
"assets/assets/images/temples/temple2.jpg": "ed533fecb23332f5918182a960d1fa0a",
"assets/assets/images/temples/temple3.jpg": "5999cb0d56e9c9090b7a71858cdc76c2",
"assets/assets/images/temples/temple4.jpg": "e61b58765cbbc255555f1ae7be24b86b",
"assets/assets/images/temples/temple5.jpg": "b5bd968d888089691e39804c69eb5e27",
"assets/assets/images/temples/temple6.jpg": "05df111861d06243c2e5602d2c6b3b1e",
"assets/assets/images/temples/temple7.jpg": "22c420cd49d1411fb9d1a420d7b6fbea",
"assets/assets/images/temples/temple8.jpg": "4b9a734e5080cffdd354ab26839016d2",
"assets/assets/images/Thanjavur.jpg": "bcd360a2ba1a6af4a067fe3bbabb12db",
"assets/assets/images/TNtour.jpg": "07a9d2a5c1e33319b471e81b4b779e08",
"assets/assets/images/whatsapp.png": "cc7ed84031a39e69a28d9a007c06d56f",
"assets/FontManifest.json": "ea79ceccbb66ace406b5e88f349ee23c",
"assets/fonts/MaterialIcons-Regular.otf": "a6de6548c0a312b88af29c1ff66e6e60",
"assets/NOTICES": "d570faabe7f4e258ccbfd3be0bb3b4f7",
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
"flutter_bootstrap.js": "a438b1ff676b455046900d101a285861",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "7313740bc936836b2801a8b757000d7a",
"/": "7313740bc936836b2801a8b757000d7a",
"main.dart.js": "8e2b926f9df7676c93e0c783249c4374",
"manifest.json": "fd46e35bcbb5a70720f78fe979b26333",
"robots.txt": "2d49ced38576ffde1cf969fbc1c06196",
"sitemap.xml": "bac6a56d5c8125f5e8b08a0ca0d0338b",
"version.json": "d785a9aa6eb47eb2bdcbc307eb75dc39",
"_headers": "c1209bd644ad351b9f5d137de866c54e",
"_redirects": "589ca9d89a097831238154576fd8ab52"};
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
