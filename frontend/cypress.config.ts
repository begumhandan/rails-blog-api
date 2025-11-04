import { defineConfig } from "cypress";

export default defineConfig({
  e2e: {
    baseUrl: "http://localhost:8080", // Vite dev server portun
    supportFile: false,
    video: true, // video kaydını aktif et
    videosFolder: "cypress/videos", // videoların kaydedileceği klasör
    screenshotsFolder: "cypress/screenshots",
    videoCompression: false, // kaliteyi artırır
    defaultCommandTimeout: 5000, // bekleme süresini uzatır
  },
});
