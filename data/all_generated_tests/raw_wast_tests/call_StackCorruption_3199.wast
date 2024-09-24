;; Test Description 8: Include a `call` instruction within a loop that executes multiple iterations. Each iteration will modify and utilize stack variables. This tests for cumulative stack mismanagement or corruption over successive function calls.

(assert_invalid
  (module
    (func $callee (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 1))
    )
    (func $type-loop-call
      (local i32)
      (local.set 0 (i32.const 10))
      (loop
        (local.set 0 (call 1 (local.get 0)))
        (br_if 0 (local.get 0))
      )
    )
    (func (param i32))
  )
  "type mismatch"
)