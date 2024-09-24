;; 10. **Test 10**: A complex control flow inside a loop with `br_if` and other control instructions. Both inner and outer loops must break correctly without running indefinitely due to the correct implementation of stack polymorphism and operand unwinding.

(assert_invalid
  (module (func $complex-loop-br_if
    (loop $outer (block $break (i32.const 1)
      (loop $inner (block (br_if 0 (i32.const 0)) (br_if 1 (i32.const 1))))
      (br_if $break (i32.const 0))
    ))
  ))
  "type mismatch"
)