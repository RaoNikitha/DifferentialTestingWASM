;; 7. **Test 7 - Nested Block Exit Misinterpretation**:    Create a nested block structure where `br_table` attempts to exit from deeper inner blocks incorrectly, violating the rule that branches can only exit outer blocks. This checks if the CFG is correctly generated for structured control flow.

(assert_invalid
  (module
    (func
      (block
        (block 
          (block 
            (br_table 2 (i32.const 0)) ;; should be invalid as it attempts to exit too many nested blocks incorrectly
          )
        )
      )
    )
  )
  "unknown label"
)