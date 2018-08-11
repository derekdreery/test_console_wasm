const rust = import('./test_console_wasm');

rust.then(m => {
    console.log(m.time_something(10000))
});
