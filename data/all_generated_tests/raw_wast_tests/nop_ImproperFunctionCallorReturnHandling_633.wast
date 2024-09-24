;; 4. Define a function where `nop` is placed at the beginning, followed by multiple nested function calls. Ensure that each nested function call is executed in the correct sequence and produces the correct cumulative result.

(assert_invalid
  (module
    (func $nested-call (result i32)
      (nop)
      (call $func-a)
      (call $func-b)
      (call $func-c)
      (i32.add)
      (call $func-d))
    (func $func-a (result i32) (i32.const 1))
    (func $func-b (result i32) (i32.const 2))
    (func $func-c (result i32) (i32.const 3))
    (func $func-d (result i32) (i32.const 4)))
  "type mismatch")