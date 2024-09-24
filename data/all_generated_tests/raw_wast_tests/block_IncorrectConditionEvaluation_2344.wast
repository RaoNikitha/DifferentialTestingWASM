;; 5. Create a sequence with an enclosing block and several nested `br_if` instructions each conditioned on different i32 constant values. Check which branch paths are taken depending upon initial conditions and ensure correct stack management for each path.

(assert_invalid
  (module (func $differential_test (result i32)
    (block (result i32)
      (block (br_if 0 (i32.const 0)))
      (block (br_if 1 (i32.const 1)))
      (i32.const 42)
    )
  ))
  "type mismatch"
)