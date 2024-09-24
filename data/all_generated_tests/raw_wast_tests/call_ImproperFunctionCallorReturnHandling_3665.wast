;; 4. Invoke a function with arguments of incorrect types (e.g., providing integers instead of floats); test if engines handle type mismatches appropriately at call time.

(assert_invalid
  (module
    (func $func-with-floats (param f32) (param f32))
    (func $call-with-integers (call 0 (i32.const 1) (i32.const 2)))
  )
  "type mismatch"
)