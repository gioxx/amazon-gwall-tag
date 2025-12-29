"use strict";

const AFFILIATE_TAG = "gioxx-21";

const SKIP_PATHS = [
  /^\/ap\//,          // login flow
  /^\/checkout\//,    // checkout flow
  /^\/gp\/buy\//,     // buy steps
  /^\/gp\/sign-in/    // alternate sign-in
];

function shouldSkip(url) {
  return SKIP_PATHS.some((pattern) => pattern.test(url.pathname));
}

function handleRequest(details) {
  const url = new URL(details.url);
  if (shouldSkip(url)) return {};

  url.searchParams.set("tag", AFFILIATE_TAG);
  return { redirectUrl: url.toString() };
}

const filter = {
  urls: ["*://*.amazon.it/*"],
  types: ["main_frame", "sub_frame"]
};

browser.webRequest.onBeforeRequest.addListener(
  handleRequest,
  filter,
  ["blocking"]
);
