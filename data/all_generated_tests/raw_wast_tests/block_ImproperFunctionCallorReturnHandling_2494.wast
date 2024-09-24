;; A `block` instruction contains a function call followed immediately by a `br_if` instruction that conditionally branches out of the block based on the return value. This validates that the stack state is correctly managed when branching out of a block after a function call.

(assert_invalid
  (module
    (func $callee (result i32)
      i32.const 0
    )
    (func $test
      (block (result i32)
        call $callee
        br_if 0
      )
    )
  )
  "type mismatch"
)