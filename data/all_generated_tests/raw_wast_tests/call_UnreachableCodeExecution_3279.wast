;; 8. **Test Call in Nested Block Context**:    Construct nested blocks where a call inside a block does not match the block's type requirements, causing control flow to erroneously execute an `unreachable` instruction upon block exit.

(assert_invalid
  (module
    (type (func (param i32)))
    (func (result i32)
      (block (result i32)
        (call 0)
        (unreachable)
      )
    )
    (func (param i32) (result i32) (i32.const 0))
  )
  "type mismatch"
)