;; - **Test 3**:    Establish a nested loop where the inner loop has a breaking condition but the outer loop does not have any, making sure to check if the outer loop handles infinite iterations correctly.     Constraint: Inner loop exits, but outer loop is infinite.     Relation: Confirms nested loop handling and if outer loop correctly enters infinite iteration mode.

(assert_invalid
  (module
    (func $nested-loop
      (loop (result i32)
        (loop (result i32) 
          (br_if 1 (i32.const 1)) 
          (br 0)
        )
        (br 0)
      )
    )
  )
  "infinite outer loop with terminating inner loop"
)