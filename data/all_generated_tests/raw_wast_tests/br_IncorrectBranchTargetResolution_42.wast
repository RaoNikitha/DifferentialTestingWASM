;; 3. Introduce multiple nested `if` and `else` structures, with `br` targeting an `if` outside the current `else`. This checks if the implementation can properly resolve the label outside the current `else`, ensuring **label indexing in conditional branches**.

(assert_invalid
  (module (func $invalid-nested-branch (result i32)
    (block (result i32)
      (i32.const 1)
      (if (result i32)
        (then
          (i32.const 2)
          (if (result i32)
            (then
              (i32.const 3)
              (else
                (br 2) ;; attempt to break to outer block
              )
            )
          )
        )
      )
    )
  ))
  "type mismatch"
)