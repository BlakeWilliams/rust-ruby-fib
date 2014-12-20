#[allow(dead_code)]
#[no_mangle]
pub extern "C" fn fib(x: uint) -> uint {
    match x {
        0 => 0,
        1 => 1,
        n => {
            fib(n - 1) + fib(n -2)
        }
    }
}
