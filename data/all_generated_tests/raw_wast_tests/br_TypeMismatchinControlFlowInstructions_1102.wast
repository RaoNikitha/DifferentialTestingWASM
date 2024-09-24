;; 3. **Test for Control Flow with String and Integer**: Define a `block` that ends by branching to another `block` expecting an `i32` while pushing a string type (`br` to a block with a mismatched type). The test checks if string and integer type mismatches are handled correctly.

(assert_invalid
  (module
    (func $type-mismatch-block
      (block (result i32)
        (block (br 1 "string"))
        (nop)
      )
    )
  )
  "type mismatch"
)