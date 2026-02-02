const CACHE_NAME = 'vpomodoro-v1';
const ASSETS_TO_CACHE = [
  '/vpomodoro/',
  '/vpomodoro/index.html',
  '/vpomodoro/favicon.svg',
  '/vpomodoro/icon-192.png',
  '/vpomodoro/icon-512.png',
  '/vpomodoro/manifest.json',
  '/vpomodoro/libs/fonts.css',
  '/vpomodoro/libs/google-fonts.css',
  '/vpomodoro/libs/progressbar.min.js',
  // Bootstrap Icons fonts
  '/vpomodoro/libs/fonts/bootstrap-icons.woff2',
  '/vpomodoro/libs/fonts/bootstrap-icons.woff',
  // Google Fonts (locally hosted)
  '/vpomodoro/libs/google-fonts/inter-400-normal.woff2',
  '/vpomodoro/libs/google-fonts/jetbrains-mono-400-normal.woff2',
  '/vpomodoro/libs/google-fonts/roboto-slab-400-normal.woff2',
  '/vpomodoro/libs/google-fonts/montserrat-400-normal.woff2'
];

// Install event - cache all essential assets
self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      return cache.addAll(ASSETS_TO_CACHE);
    }).catch((error) => {
      console.log('Cache installation failed:', error);
    })
  );
  self.skipWaiting();
});

// Activate event - clean up old caches
self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((cacheNames) => {
      return Promise.all(
        cacheNames.map((cacheName) => {
          if (cacheName !== CACHE_NAME) {
            return caches.delete(cacheName);
          }
        })
      );
    })
  );
  self.clients.claim();
});

// Fetch event - serve from cache, fallback to network
self.addEventListener('fetch', (event) => {
  if (event.request.method !== 'GET') {
    return;
  }

  event.respondWith(
    caches.match(event.request).then((response) => {
      if (response) {
        return response;
      }

      return fetch(event.request).then((response) => {
        // Don't cache non-successful responses
        if (!response || response.status !== 200 || response.type === 'error') {
          return response;
        }

        // Cache successful responses
        const responseToCache = response.clone();
        caches.open(CACHE_NAME).then((cache) => {
          cache.put(event.request, responseToCache);
        });

        return response;
      }).catch(() => {
        // Return a fallback offline page if needed
        return caches.match('/vpomodoro/index.html');
      });
    })
  );
});
