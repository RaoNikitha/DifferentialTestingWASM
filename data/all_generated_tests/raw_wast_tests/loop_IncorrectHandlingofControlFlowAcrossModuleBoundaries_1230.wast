;; 1. **Test Case 1**: Import a function from another module that manipulates the stack in a specific way (e.g., push and pop values). Use a `loop` to repeatedly call this imported function. This test checks if the `loop` instruction in both implementations correctly handles the stack between module calls, ensuring consistent control flow and stack management.

(assert_invalid
  (module
    (import "test" "func" (func $imported (param i32) (result i32)))
    (func (result i32)
      (i32.const 0)
      (loop (result i32)
        (call $imported)
        (br 0)
      )
    )
  )
  "type mismatch"
)