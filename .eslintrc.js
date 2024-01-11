module.exports = {
  env: {
    browser: true,
    node: true,
    es6: true,
  },
  extends: ["eslint:recommended"],
  parserOptions: {
    ecmaVersion: "latest",
    sourceType: "module",
  },
  rules: {
    "no-unused-vars": "off",
    "no-console": "warn",
    "no-const-assign": "warn",
    "react/prop-types": "off",
    eqeqeq: "warn",
  },
};
