#![feature(use_extern_macros, wasm_custom_section, wasm_import_module, proc_macro_mod)]

extern crate wasm_bindgen;
extern crate web_sys;

use wasm_bindgen::prelude::*;
use web_sys::console;

#[wasm_bindgen]
pub fn time_something(sum_to: usize) -> usize {
    console::time("timing");
    let result = (0..sum_to).map(|x| x + 1).sum();
    console::time_end("timing");
    result
}

