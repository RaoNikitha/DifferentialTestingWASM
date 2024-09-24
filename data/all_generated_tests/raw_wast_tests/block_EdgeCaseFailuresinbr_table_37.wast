;; 8. Test Description: Create a `block` using a `br_table` with a significant number of jump targets, exceeding normal cases. Validate if `WebAssembly` can handle many targets gracefully and check if `wizard_engine` encounters performance or validation problems.

(assert_invalid
  (module
    (func $test-br-table
      (block (result i32)
        (block (result i32) (block (result i32) (block (result i32) (block (result i32)
          (block (result i32) (block (result i32) (block (result i32) (block (result i32)
            (block (result i32) (block (result i32) (block (result i32) (block (result i32)
              (block (result i32) (block (result i32) (block (result i32) (block (result i32)
                (block (result i32)
                  (br_table 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 (i32.const 0))
                )
              ))))
            ))))
          ))))
        ))))
      ))
    )
  )
  "too many targets for br_table"
)