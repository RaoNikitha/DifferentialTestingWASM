;; 10. Construct a block with a `call` instruction that sets a result used in a `br_if` condition. The test checks if the interaction between function call results and condition evaluation is correctly managed, leading to appropriate branching.

(assert_invalid
  (module
    (func $set-condition (result i32) (i32.const 1))
    (func (result i32)
      (block (result i32)
        (i32.const 0)
        (call $set-condition)
        (br_if 0)
      )
    )
  )
  "type mismatch"
)