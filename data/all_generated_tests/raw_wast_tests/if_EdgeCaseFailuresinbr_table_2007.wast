;; 8. **Test 8**: An `if` with a `block` that includes a `br_table` targeting a label that is defined outside the current `if` block context, to test context propagation.

(assert_invalid
  (module
    (func $type-br_table-outside-if
      (block (if (result i32) (i32.const 1) 
        (then
          (block (br_table 0 1 (i32.const 0)))
        )
        (else
          (i32.const 0)
        )
      ) (drop))
    )
  )
  "invalid label"
)