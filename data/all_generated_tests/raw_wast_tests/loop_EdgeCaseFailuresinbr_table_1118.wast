;; - **Test 9**: Create a deep nested loop with a `br_table` that includes an exact number of targets matching the index provided. Validate the loop’s backward jumps and default target under edge boundary conditions in both engines.

(assert_invalid
  (module
    (func $deep-nested-loop-br_table
      (i32.const 0)
      (loop (result i32)
        (loop (result i32)
          (loop (result i32)
            (br_table 0 1 2 3)
          )
        )
      )
    )
  )
  "type mismatch"
)