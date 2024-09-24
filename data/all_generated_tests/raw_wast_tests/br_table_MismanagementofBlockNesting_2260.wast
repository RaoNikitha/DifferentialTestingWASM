;; Test10: Structure an `if-else` within nested blocks and loops, where `br_table` in the `if` block wrongly targets the `else` block's labels. Expect `wizard_engine` to identify the arity mismatch swiftly, while WebAssembly may fall into erroneous control flow, incorrectly exiting or trapping.

(assert_invalid
  (module 
    (func $br_table_if_else_mismatch
      (block
        (loop
          (block 
            (if (i32.const 1)
              (then 
                (br_table 0 1 (i32.const 0))  ;; mismatching label targeting within if-else
              )
              (else 
                (br 0)
              )
            )
          )
        )
      )
    )
  )
  "arity mistmatch"
)