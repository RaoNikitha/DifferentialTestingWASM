;; 7. **Test Description**: Construct an outer block with an inner block that ends with a `br_if` targeting the outer block's label index, followed by an `unreachable` instruction. This tests label indexing and operand stack management to avoid `unreachable`.

(assert_invalid
  (module
    (func
      (block (result i32)
        (block
          (br_if 1 (i32.const 1))
          (unreachable)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)