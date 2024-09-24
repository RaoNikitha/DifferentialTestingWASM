;; 5. **Test Description**:    Recursive function call within a loop that relies on an `if` condition to avoid recursion:    - Assesses if improper condition evaluation and context labeling in `if` results in unbound recursive calls.

(assert_invalid
  (module
    (func $recursive (result i32)
      (local $n i32)
      (set_local $n (i32.const 10))
      (block $loop
        (loop $inner
          (if (i32.gt_u (get_local $n) (i32.const 0))
            (then
              (br $inner)
            )
            (else
              (br $loop)
            )
          )
        )
      )
    )
  )
  "unreachable code"
)