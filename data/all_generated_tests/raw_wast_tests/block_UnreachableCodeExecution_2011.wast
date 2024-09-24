;; 2. **Test Description**: Implement nested blocks where the inner block has a `br` instruction that breaks to its containing block, followed by an `unreachable` instruction in the inner block. Verify if the outer block correctly resumes after the nested block ends without reaching the `unreachable` instruction.

(assert_invalid
  (module
    (func $test-block-invalid 
      (block (result i32) 
        (block (result i32) 
          (br 1) 
          (unreachable)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)