;; - Test Case 2: Design a nested loop structure where an outer loop conditionally branches to an `unreachable` instruction if an inner loop's condition fails. This verifies proper nested label indexing and control flow handling.

(assert_invalid
  (module
    (func $nested-loop-condition
      (loop $outer (result i32)
        (i32.const 1)
        (loop $inner (result i32)
          (i32.const 0)
          (br_if $inner (i32.const 1))
          (br $outer)
        )
        unreachable
      )
    )
  )
  "type mismatch"
)