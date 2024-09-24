;; - Test 7: Induce stack corruption by creating a loop that expects specific stack values and types, then providing scenarios where `br_if` causes control to exit early, resulting in an improper stack state at loop re-entry.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 1) (i32.const 2) ;; Stack: [1, 2]
      (loop (result i32)
        (br_if 0 (i32.const 0)) ;; No-op branch, stack remains [1, 2]
        (drop) (drop) ;; Empty the stack
        (i32.const 3) (i32.const 4) ;; Stack: [3, 4]
      )
    )
  )
  "stack type mismatch on re-entry"
)