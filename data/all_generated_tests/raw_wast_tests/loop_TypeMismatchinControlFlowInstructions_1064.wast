;; Test 5: Create a loop with a conditionally executed block (`br_if`) that manipulates the stack in a way that results in a type mismatch when re-entering the loop. This tests the handling of conditional branches and type constraints.

(assert_invalid
  (module
    (func $conditional-br-if (result i32)
      (loop (result i32)
        (i32.const 1)
        (br_if 0 (i32.const 0))
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)