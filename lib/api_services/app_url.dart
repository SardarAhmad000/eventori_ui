// Switch this flag depending on environment
const bool useLiveServer = false;
// const String LOCAL_URL_BASE = 'http://192.168.18.65:3000';
// const String LOCAL_URL_BASE = 'https://84a68fded767.ngrok-free.app';
const String LOCAL_URL_BASE = 'http://192.168.18.126:3000';
const String LOCAL_URL = '$LOCAL_URL_BASE/eventori/api/';
const String Live_URL_BASE = 'https://deploy-racrally.onrender.com';
// const String Live_URL_BASE = 'https://learning-similarly-redfish.ngrok-free.app';
// const String NGROK_URL_BASE = 'https://reindeer-related-hookworm.ngrok-free.app';
const String LIVE_URL = '$Live_URL_BASE/api/v1';

String get BASE_URL => useLiveServer ? LIVE_URL:LOCAL_URL;