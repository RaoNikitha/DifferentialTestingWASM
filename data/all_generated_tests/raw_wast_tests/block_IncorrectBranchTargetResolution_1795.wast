;; 6. **Test Description**: A `loop` inside a `block` with a `br` instruction targeting the `block` rather than the `loop` or vice versa.    **Reasoning**: Tests how different implementations resolve branches between nested `blocks` and `loops`, potentially exposing label mismanagement.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (loop
          (br 1)
          (i32.const 42)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)