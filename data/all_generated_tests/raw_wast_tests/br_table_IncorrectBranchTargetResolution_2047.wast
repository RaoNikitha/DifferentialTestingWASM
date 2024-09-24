;; 7. **Nested Block with Multiple Outwards Branches:**    Test nested blocks with multiple `br_table` instructions targeting outer blocks.    - **Test Constraint:** Allows verifying adherence to structured control flow.    - **Expected Differential:** WebAssembly should maintain structured control rules, while wizard_engine might miscalculate the nesting depth.

(assert_invalid
  (module
    (func
      (block
        (block
          (br_table 0 1 (i32.const 1))
          (br_table 1 0 (i32.const 0))
        )
      )
    )
  )
  "unknown label"
)