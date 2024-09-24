;; 8. **Test Description**: Create a long chain of `if-else` constructs inside a `loop`, each `if` containing a `br_if` targeting the loop start. Test for accurate backward jump and parameter handling by the loop.    - **Constraint Checked**: Operand handling in complex conditional loops.    - **CFG Relation**: Confirms correct CFG representation for backward jumps within conditional sequences.

(assert_invalid
  (module
    (func $complex-loop
      (loop $loop
        (if (i32.eqz (i32.const 0)) (br_if 0 (i32.const 1)))
        (if (i32.eqz (i32.const 0)) (br_if 0 (i32.const 1)))
        (if (i32.eqz (i32.const 0)) (br_if 0 (i32.const 1)))
        (if (i32.eqz (i32.const 0)) (br_if 0 (i32.const 1))) 
        (br 1)
      )
      (i32.const 0)
    )
  )
  "unknown label"
)