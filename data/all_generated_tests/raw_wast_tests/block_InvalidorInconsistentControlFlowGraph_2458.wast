;; 9. **Test Description**: Use overlapping block labels in an overly complex structure causing label resolution conflicts which WebAssembly might mishandle.    - **Constraint Checked**: Label resolution handling in nested blocks.    - **Relation to CFG**: CFG errors from label misresolutions, causing incorrect branching paths.

(assert_invalid
 (module
   (func $complex-nesting (result i32)
     (block $l1 (result i32)
       (block $l2
         (block (result f64)
           (br $l1 (f64.const 0.0))
         )
         (br $l2)
       )
       (i32.const 1)
     )
   )
 )
 "type mismatch"
)