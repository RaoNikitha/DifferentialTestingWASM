;; 1. Insert multiple `nop` instructions interleaved with arithmetic operations (e.g., add, subtract). Check for stack consistency after each operation to ensure the `nop` instructions do not cause stack corruption.

(assert_invalid
  (module
    (func $test
      i32.const 10
      nop
      i32.const 20
      nop
      i32.add
      nop
      i32.const 5
      i32.sub
      drop
    )
  )
  "type mismatch"
)