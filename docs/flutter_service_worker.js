'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"app-ads.txt": "f460b4b47e7684c6bd9ad6bb7a271064",
"assets/AssetManifest.bin": "4f97adbd9494e7ff84a31ca5a45e7e46",
"assets/AssetManifest.bin.json": "adafc1a17dac71a84d5253140d51643d",
"assets/assets/fonts/custom-icon.ttf": "2d9318428ad6e26377be2be8d7cdae39",
"assets/assets/fonts/NotoColorEmoji-Regular.ttf": "c358f057ef2a35624d091fb9562e8e7e",
"assets/assets/png/ic_developer_128.png": "540db08678c78215ef297f2d6f0d5c3a",
"assets/assets/png/ic_flip_game_128.png": "7e40402aeb0ae4eabe988af72e4d0e4f",
"assets/assets/png/ic_poker_point_128.png": "a404f0711cbe61ba48bfebb51406d90d",
"assets/assets/png/ic_tap_tap_128.png": "8b7af977254b85d38eadab5e2c3caa0f",
"assets/assets/webp/ic_developer_128.webp": "2d2ea3100bc9399d57ea55dace94e927",
"assets/assets/webp/ic_flip_game_128.webp": "895545cf63ca8143ded1bf01d06ba6ab",
"assets/assets/webp/ic_poker_point_128.webp": "b1bc4930dd221bc0bf4bc4ae04c2f26f",
"assets/assets/webp/ic_tap_tap_128.webp": "668070e93f54c0e4c2077d1ac1c2d56a",
"assets/FontManifest.json": "caa2e5e3d22665e9a08f9b3ddc185f26",
"assets/fonts/MaterialIcons-Regular.otf": "de883645202b92ea68452ae073b7e2a5",
"assets/NOTICES": "3814b800b52333ab46b61098e5519cf6",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"favicon.png": "e9f432c9feec2c381e46fd43ba112fb6",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"flutter_bootstrap.js": "488c985ec0af30643a974b06cfb6b07c",
"icons/Icon-192.png": "b61dbaa7c1b1c5aea03c4ea4c712718b",
"icons/Icon-512.png": "664d8f7aa3794d976975dd0ece1f73ec",
"icons/Icon-maskable-192.png": "b61dbaa7c1b1c5aea03c4ea4c712718b",
"icons/Icon-maskable-512.png": "f13bbcd25be085ef7a3c951b89c4a06c",
"index.html": "984b9cf128041a70383b9d0db54a60ae",
"/": "984b9cf128041a70383b9d0db54a60ae",
"main.dart.js": "9afacb9e46e2f3f9545237963f2ce71d",
"main.dart.mjs": "bd71d9d8da89bab51ed0b1e73d2b611b",
"main.dart.wasm": "a0894e4744a3b47b2b401e048598f9c5",
"main.dart.wasm.map": "6e20732a31c57ba8280e43b3e33ab8a0",
"manifest.json": "50a3536323a5dc28597133f5d41ccef6",
"privacypolicy/FlipGame_Policy.html": "51de01fe9238ae180fbb5015bc13cd05",
"privacypolicy/livelink.css": "b21ed5437c818da6ffb092345aa6039a",
"privacypolicy/PokerPoint_F_Policy.html": "ff29033388a18bb2011ccb6ea0653d8d",
"privacypolicy/PokerPoint_Policy.html": "3872de0fc03e0fbedebde240de563451",
"privacypolicy/TapTap_Policy.html": "51de01fe9238ae180fbb5015bc13cd05",
"version.json": "9f072fb9cd1a3c443f38d10ff23ccd14"};
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
