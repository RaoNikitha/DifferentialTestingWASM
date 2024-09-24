;; 5. **Test Description**: Call a function within another function that recursively invokes itself. Check depth management to ensure the call stack isn't corrupted.    **Constraint Checked**: Recursive call depth handling.    **Relation to Stack Corruption**: Improper depth management can lead to stack overflows or call frame corruption.

(assert_invalid
  (module
    (func $recursive (param i32) (result i32)
      (local.get 0)
      (i32.const 1)
      (i32.sub)
      (local.tee 0)
      (i32.const 0)
      (i32.gt_s)
      (if (result i32)
        (then
          (call $recursive (local.get 0))
        )
      )
    )
    (func $start
      (i32.const 10)
      (call $recursive)
      (drop)
    )
  )
  "type mismatch"
)