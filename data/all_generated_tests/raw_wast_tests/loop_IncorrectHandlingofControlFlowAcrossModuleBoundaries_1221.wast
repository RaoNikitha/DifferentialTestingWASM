;; 2. **Test Description**: Create a test where a module exports a function with a `loop` instruction and imports another function. The imported function is called within the loop and branches conditionally back to the loop start using `br_if`. This ensures correct state handling and stack integrity during calls crossing module boundaries.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc (param) (result i32)))
    (func (export "testFunc")
      (loop (result i32)
        (call $externalFunc)
        (i32.const 0)
        (br_if 1)
      )
    )
  )
  "type mismatch"
)