import resolve from "@rollup/plugin-node-resolve";
import terser from "@rollup/plugin-terser";

export default {
  input: "app/javascript/activeadmin_slimselect/index.mjs",
  output: {
    file: "app/assets/javascripts/active_admin/activeadmin_slimselect.js",
    format: "umd",
    name: "ActiveAdminSlimSelect"
  },
  plugins: [
    resolve(),
    terser()
  ]
};
