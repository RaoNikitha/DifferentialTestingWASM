;; 2. **Test Nested `LOOP` Branch**: Nested `loop` blocks where an inner `br_if` should target an `unreachable` instruction in the outer `loop`. This test ensures label arguments in `loop` structures are correctly handled, preventing unintended execution paths.

(assert_invalid
  (module 
    (func $nested-loop-br_if
      (loop 
        (i32.const 0)
        (loop
          (br_if 1 (i32.const 1))
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)