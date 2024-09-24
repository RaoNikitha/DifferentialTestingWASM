;; Function with a `br` instruction intended to target an intermediate block, followed by a `return`, checking to ensure that the `return` correctly targets the function's outermost block and not the block pointed to by the `br`.  These test descriptions target scenarios specifically designed to reveal issues in branch target resolution, ensuring that incorrect jumps due to wrongly resolved labels can be detected in the function's control flow.

(assert_invalid
  (module
    (func $br-return-target (result i32)
      (i32.const 1)
      (block
        (block
          (br 1)
          (return (i32.const 2))
        )
      )
    )
  )
  "type mismatch"
)