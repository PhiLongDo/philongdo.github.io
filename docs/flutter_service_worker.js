'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"app-ads.txt": "f460b4b47e7684c6bd9ad6bb7a271064",
"assets/AssetManifest.bin": "7679b7bc4c24a7f4d0f99c69b1d82c1d",
"assets/AssetManifest.bin.json": "d64e4dbf8fb3d6a39918d861dcf2caae",
"assets/AssetManifest.json": "585f70a93c338e940a7a58ccbaee5679",
"assets/assets/fonts/NotoColorEmoji-Regular.ttf": "c358f057ef2a35624d091fb9562e8e7e",
"assets/assets/png/ic_developer_128.png": "540db08678c78215ef297f2d6f0d5c3a",
"assets/assets/png/ic_flip_game_128.png": "7e40402aeb0ae4eabe988af72e4d0e4f",
"assets/assets/png/ic_poker_point_128.png": "a404f0711cbe61ba48bfebb51406d90d",
"assets/assets/png/ic_tap_tap_128.png": "8b7af977254b85d38eadab5e2c3caa0f",
"assets/assets/webp/ic_developer_128.webp": "2d2ea3100bc9399d57ea55dace94e927",
"assets/assets/webp/ic_flip_game_128.webp": "895545cf63ca8143ded1bf01d06ba6ab",
"assets/assets/webp/ic_poker_point_128.webp": "b1bc4930dd221bc0bf4bc4ae04c2f26f",
"assets/assets/webp/ic_tap_tap_128.webp": "668070e93f54c0e4c2077d1ac1c2d56a",
"assets/FontManifest.json": "eea7fad4bee576cfbafea1c0e9896ce8",
"assets/fonts/MaterialIcons-Regular.otf": "fd662f62a99e2c43b30b8ca061147d51",
"assets/NOTICES": "cc87474737e3219b9be7b913ba4fc42b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "e9f432c9feec2c381e46fd43ba112fb6",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "24410a238f26a3908212ee7714ba38b7",
"icons/Icon-192.png": "b61dbaa7c1b1c5aea03c4ea4c712718b",
"icons/Icon-512.png": "664d8f7aa3794d976975dd0ece1f73ec",
"icons/Icon-maskable-192.png": "b61dbaa7c1b1c5aea03c4ea4c712718b",
"icons/Icon-maskable-512.png": "f13bbcd25be085ef7a3c951b89c4a06c",
"index.html": "984b9cf128041a70383b9d0db54a60ae",
"/": "984b9cf128041a70383b9d0db54a60ae",
"main.dart.js": "432cc5e04a8b887767e8f8118d00df47",
"main.dart.mjs": "7daa272fabe01336ede3fa20871f6255",
"main.dart.wasm": "5d7d09361e85329723c5a53695e1d906",
"manifest.json": "50a3536323a5dc28597133f5d41ccef6",
"privacypolicy/FlipGame_Policy.html": "51de01fe9238ae180fbb5015bc13cd05",
"privacypolicy/livelink.css": "b21ed5437c818da6ffb092345aa6039a",
"privacypolicy/PokerPoint_F_Policy.html": "ff29033388a18bb2011ccb6ea0653d8d",
"privacypolicy/PokerPoint_Policy.html": "3872de0fc03e0fbedebde240de563451",
"privacypolicy/TapTap_Policy.html": "51de01fe9238ae180fbb5015bc13cd05",
"version.json": "8adb28400cee5094febcca887e2641d2"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"main.dart.wasm",
"main.dart.mjs",
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
