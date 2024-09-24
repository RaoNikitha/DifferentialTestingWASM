;; 2. **Test Description**: A nested `br_table` within several nested blocks where the operand is precisely at the boundary limit, causing an error due to misconfigured operand stack length that should lead to the default label pointing to an `unreachable` instruction. This checks for boundary handling of operand indexing.

(assert_invalid
  (module
    (func
      (block
        (loop
          (block (result i32)
            (br_table 1 2 (i32.const 1) (unreachable))
          )
        )
      )
    )
  )
  "unknown label"
)