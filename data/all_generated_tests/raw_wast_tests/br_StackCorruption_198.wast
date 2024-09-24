;; 9. **Cross Function Calls:**    Develop a scenario with function calls containing branches that target labels outside the current function’s scope but within nested calls. This will test for stack consistency across function boundaries.

(assert_invalid
  (module
    (func $cross-function-call
      (call $nestedFunc)
      (block $outerBlock
        (call $branchFunction (br 0)) 
      )
    )
    (func $nestedFunc (result i32)
      (block (result i32)
        (block $innerBlock (br 1))
        (i32.const 1)
      )
    )
    (func $branchFunction (param i32)
      (block
        (drop)
      )
    )
  )
  "type mismatch"
)