;; - Use a loop with multiple nested blocks where the return instruction should break out of all blocks and loops. Validate if the return exits to the end of the outermost loop or if it mistakenly re-enters an intermediate block instead.

(assert_invalid
  (module
    (func $test-return-in-loop (result i32)
      (loop $outer
        (block $intermediate
          (block $inner
            (return (i32.const 42))
            (br $inner)
          )
          (br $intermediate)
        )
        (br $outer)
      )
    )
  )
  "type mismatch"
)