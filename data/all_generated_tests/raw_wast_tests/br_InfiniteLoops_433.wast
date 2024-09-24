;; 4. **Test Description:** Simulate a loop with a `br_table` instruction that conditionally branches to different labels, one of which erroneously targets itself or leads to excessive unwinding of the stack, potentially causing infinite recursion.

(assert_invalid
  (module
    (func $test-loop-br-table
      (block $outer (result i32)
        (loop $inner
          (i32.const 0) ;; Push a value onto the stack
          (i32.const 1) ;; Another value for br_table
          (br_table $inner $outer) ;; Conditionally branch, but $inner should cause infinite loop or invalid jump
        )
      )
    )
  )
  "type mismatch"
)