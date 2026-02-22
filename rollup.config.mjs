import resolve from "@rollup/plugin-node-resolve";
import commonjs from "@rollup/plugin-commonjs";
import terser from "@rollup/plugin-terser";

const terserOptions = {
  mangle: false,
  compress: false,
  output: {
    beautify: true,
    indent_level: 2
  }
};

export default {
  input: "app/javascript/activeadmin_slimselect/index.js",
  output: {
    file: "app/assets/javascripts/active_admin/activeadmin_slimselect.js",
    format: "umd",
    name: "ActiveAdminSlimSelect"
  },
  plugins: [
    resolve(),
    commonjs(),
    terser(terserOptions)
  ]
};
