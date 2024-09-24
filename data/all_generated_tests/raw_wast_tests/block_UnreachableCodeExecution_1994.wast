;; 5. Design a block with multiple `blocktype` entries resulting in a chain of nested blocks, ensuring one internal block has an improper `br` target that unintentionally reaches an `unreachable`. Test proper unwinding of stack states among nested blocks.

(assert_invalid
  (module 
    (func $test-multiple-blocktype (result i32)
      (block (result i32)
        (block (result i64)
          (block (result f64)
            (br 3)
          )
        )
      )
      (i32.const 0)
    )
  )
  "label index out of range"
)