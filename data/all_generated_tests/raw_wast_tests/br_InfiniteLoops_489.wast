;; 10. A deeply nested `loop` and `if` structure where `br` targets the most recently declared `label`, ensuring correct relative label indexing. Verifying if the label referencing in complex nested contexts correctly transitions control flow within the structured control, preventing infinite loop issues.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (loop (result i32)
        (if (i32.const 1)
          (then
            (block (result i32)
              (loop (result i32)
                (br 1)
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)