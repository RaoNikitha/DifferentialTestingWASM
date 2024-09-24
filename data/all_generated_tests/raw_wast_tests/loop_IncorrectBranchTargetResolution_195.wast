;; 6. Formulate a loop with interleaved `block` and `loop` instructions where `br` targets the outermost block instead of the loop. Verify the proper branch target resolution and ensure the `br` instruction correctly jumps to the enclosing block, testing for ambiguity in label handling.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (loop (result i32)
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)