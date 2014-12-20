#[no_mangle]
pub extern "C" fn slow_fib(n: u64) -> u64 {
    match n {
        0 => 0,
        1 => 1,
        n => {
            slow_fib(n - 1) + slow_fib(n -2)
        }
    }
}

#[no_mangle]
pub extern "C" fn fib(n: u64) -> u64 {
    match n {
        0 => 0,
        1 => 1,
        n => _fib(n, 1, 1)
    }
}

pub fn _fib(target: u64, previous: u64, next: u64) -> u64 {
    if target == 3 {
        previous + next
    } else {
        _fib(target -1, next, previous + next)
    }
}

#[test]
fn fib_returns_0_when_passed_0() {
    let result = fib(0);
    assert_eq!(result, 0);
}

#[test]
fn fib_returns_1_when_passed_1() {
    let result = fib(1);
    assert_eq!(result, 1);
}

#[test]
fn fib_returns_13_when_passed_7() {
    let result = fib(7);
    assert_eq!(result, 13);
}
