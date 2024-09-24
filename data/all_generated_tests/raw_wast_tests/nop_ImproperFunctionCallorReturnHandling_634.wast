;; 5. Create a function with `nop` interspersed between multiple `call` instructions to different functions. The output should be a combined result from all called functions, checking that `nop` does not alter the call sequence.

(assert_invalid
  (module
    (func $func1 (result i32) i32.const 10 nop)
    (func $func2 (result i32) i32.const 20 nop)
    (func (result i32) call $func1 nop call $func2 nop i32.add)
  )
  "type mismatch"
)