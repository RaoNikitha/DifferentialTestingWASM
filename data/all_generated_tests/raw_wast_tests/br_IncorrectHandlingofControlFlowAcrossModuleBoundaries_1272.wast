;; 3. **Test with Mixed Block and Loop Constructs:**    - Combine `block` and `loop` constructs in module A, using `br` to break out of blocks or back to loop beginnings. Import and call a function from module B inside these constructs to test proper stack handling during nested control flow transitions across module calls.    - **Constraint Checked:** Proper stack unwinding and label targeting in mixed control constructs.    - **Relation to Constraint:** Examines whether the stack remains consistent when executing cross-module transitions within complicated nested constructs.

(assert_invalid
  (module 
    (import "moduleB" "func" (func $funcB (param i32) (result i32)))
    (func $main (result i32)
      (block (result i32)
        (loop (result i32)
          (call $funcB (i32.const 5))
          (br 2) ; Exceeds depth, invalid
        )
      )
    )
  )
  "unknown label"
)