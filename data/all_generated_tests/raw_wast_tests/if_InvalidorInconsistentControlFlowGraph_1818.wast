;; 9. Create a test involving a block containing an `if` statement that includes improper label indexing, causing incorrect jump targets in CFG. Validates correct handling of label scopes.

(assert_invalid
  (module
    (func $invalid-label-index (result i32)
      (block
        (if (result i32)
          (i32.const 1)
          (then (br 1)) ; Invalid label index
          (else (i32.const 0))
        )
      )
    )
  )
  "unknown label 1"
)