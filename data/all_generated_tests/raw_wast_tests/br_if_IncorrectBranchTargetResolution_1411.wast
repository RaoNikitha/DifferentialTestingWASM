;; 2. **Test Description**: Use a combination of `loop` and nested `if` structures, with a `br_if` intended to continue (`br_if` with label `0` targeting the loop) on a specific condition. Check if the loop indeed restarts or if the branch incorrectly targets an `if` block or another outer structure.

(assert_invalid
  (module
    (func $loop-with-nested-if
      (loop
        (if (i32.const 1)
          (then
            (br_if 0 (i32.const 1) (nop))
          )
        )
      )
    )
  )
  "type mismatch"
)