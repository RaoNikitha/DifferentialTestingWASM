;; 2. **Testing Loop Result Type Mismatch:**    - Write a loop that asserts a `f64` type operand upon branching back to the start with `br`. Make the loop body provide an `i64` operand instead. This ensures that the implementation checks input type consistency for backward branches.

(assert_invalid
  (module (func $loop-result-type-mismatch
    (loop (result f64) (i64.const 42) (br 0))
  ))
  "type mismatch"
)