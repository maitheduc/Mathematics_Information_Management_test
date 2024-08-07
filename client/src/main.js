import router from "@/routes/route";
import pinia from "@/store/store";
import "nprogress/nprogress.css";
import { createApp } from "vue";
import App from "./App.vue";
import vuetify from "@/configs/vuetify.config";
import "./global.css";
import { VueQueryPlugin } from "@tanstack/vue-query";

const app = createApp(App);

app.use(VueQueryPlugin);
app.use(router);
app.use(pinia);
app.use(vuetify);
app.mount("#app");
