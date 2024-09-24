;; A `block` instruction has a function call with a `br` instruction targeting a label within the block but is inside another `block` nested within it, testing if the engines correctly resolve label indexing and handling of returns amidst nested blocks and function calls.

(assert_invalid
  (module (func $nested-block-resolution (result i32)
    (block (result i32)
      (block (result i64)
        (call $dummy)
        (br 1 (i32.const 42))
      )
      (i32.const 0)
    )
  ))
  "type mismatch"
)